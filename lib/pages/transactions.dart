import 'package:crypto_app/core/models/transactions_model.dart';
import 'package:crypto_app/core/view_models/block_provider.dart';
import 'package:crypto_app/core/view_models/transactons_provider.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transactions extends StatefulWidget {
  Transactions({Key? key, required this.hash}) : super(key: key);

  final String hash;

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  late TransactionsProvider transactionsProvider;

  //late initialization of future to be passed to the future builder
  late Future<List<TransactionModel>> _future;

  @override
  void initState() {
    super.initState();

    ///We run and assign this future only when the page loads for the first time
    ///This way we avoid unneccesary API calls everytime the widget tree rebuilds
    _future = context.read<TransactionsProvider>().getTransactions(
          widget.hash,
          refreshList: true,
        );
  }

  @override
  Widget build(BuildContext context) {
    transactionsProvider = context.watch<TransactionsProvider>();
    final _themeData = Theme.of(context);
    final _divider = Divider(height: 10, color: Colors.grey);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        backgroundColor: primaryColor,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return transactionsProvider.getTransactions(widget.hash, refreshList: true);
        },
        child: FutureBuilder<List<TransactionModel>>(
          future: _future,
          builder: (_, snapshot) {
            final data = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            if (data == null || data.isEmpty) {
              return Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                      Text(
                        'No transactions are available.',
                        textAlign: TextAlign.center,
                        style: _themeData.textTheme.caption!.copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => _divider,
              primary: false,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (_, index) {
                final transaction = data[index];
                return ListTile(
                  title: Text("Transaction ${index + 1}"),
                  subtitle: Text("Fee: ${transaction.fee}"),
                  trailing: Text('${transaction.voutSz} BTC'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
