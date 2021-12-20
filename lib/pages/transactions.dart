import 'package:crypto_app/core/view_models/block_provider.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/did_build.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transactions extends StatefulWidget {
  Transactions({Key? key, this.hash}) : super(key: key);

  final String? hash;

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> with DidBuild {
  late BlockProvider blockProvider;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    blockProvider = context.read<BlockProvider>();
    final _themeData = Theme.of(context);
    final _divider = Divider(height: 10, color: Colors.grey);

    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        backgroundColor: primaryColor,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            ))
          : Builder(
              builder: (_) {
                final _list = blockProvider.transactions;

                if (_list.isEmpty || widget.hash == null) {
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
                  itemCount: _list.length,
                  itemBuilder: (_, index) {
                    final transaction = _list[index];
                    return ListTile(
                      title: Text("Transaction ${index + 1}"),
                      subtitle: Text("Fee: ${transaction.fee}"),
                      trailing: Text('${transaction.voutSz} BTC'),
                    );
                  },
                );
              },
            ),
    );
  }

  @override
  void didBuild(BuildContext context) async {
    if (widget.hash == null) return;
    setState(() {
      _isLoading = true;
    });
    await blockProvider.getTransactions(widget.hash!);
    setState(() {
      _isLoading = false;
    });
  }
}
