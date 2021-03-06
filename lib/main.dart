import 'package:crypto_app/core/view_models/block_provider.dart';
import 'package:crypto_app/core/view_models/transactons_provider.dart';
import 'package:crypto_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/locator.dart';

void main() {
  //initialize service locator for dependency injection
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BlockProvider>(
          create: (context) => BlockProvider(),
        ),
        ChangeNotifierProvider<TransactionsProvider>(
          create: (context) => TransactionsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Crypto UI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
