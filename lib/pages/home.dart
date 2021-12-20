import 'package:crypto_app/core/view_models/block_provider.dart';
import 'package:crypto_app/pages/transactions.dart';
import 'package:crypto_app/pages/widgets/portfolio_card.dart';
import 'package:crypto_app/utils/colors.dart';
import 'package:crypto_app/utils/did_build.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with DidBuild {
  late BlockProvider blockProvider;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    blockProvider = context.read<BlockProvider>();

    final _themeData = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Coins'),
        backgroundColor: primaryColor,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: primaryColor,
            ))
          : Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: RefreshIndicator(
                //add pull to refresh
                onRefresh: () {
                  return blockProvider.geLatestBlock();
                },
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    PortfolioCard(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Assets',
                      style: _themeData.textTheme.caption!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Transactions(hash: blockProvider.latestBlock?.hash!)));
                      },
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade200,
                        child: Image.asset(
                          'assets/images/bitcoin.png',
                          width: 25,
                        ),
                      ),
                      title: Text(
                        'Bitcon',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('View all BTC transactions'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Transactions()));
                      },
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade200,
                        child: Image.asset(
                          'assets/images/tezos.png',
                          width: 25,
                        ),
                      ),
                      title: Text(
                        'Tezos',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'View all XTZ transactions',
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Transactions(hash: blockProvider.latestBlock?.hash!)));
                      },
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade200,
                        child: Image.asset(
                          'assets/images/eos.png',
                          width: 25,
                        ),
                      ),
                      title: Text(
                        'Eos',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'View all XTZ transactions',
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Transactions(hash: blockProvider.latestBlock?.hash!)));
                      },
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey.shade200,
                        child: Image.asset(
                          'assets/images/ethereum.png',
                          width: 25,
                        ),
                      ),
                      title: Text(
                        'Ethereum',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('View all ETH transactions'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void didBuild(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    await blockProvider.geLatestBlock();
    setState(() {
      _isLoading = false;
    });
  }
}
