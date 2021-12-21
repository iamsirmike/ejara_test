import 'package:crypto_app/core/models/transactions_model.dart';
import 'package:crypto_app/core/services/block_service.dart';
import 'package:crypto_app/core/services/locator.dart';
import 'package:flutter/material.dart';

class TransactionsProvider extends ChangeNotifier {
  BlockServiceImpl _blocksServiceImpl = locator<BlockServiceImpl>();

  List<TransactionModel> _transactions = [];

  Future<List<TransactionModel>> getTransactions(String hash, {bool refreshList = false}) async {
    ///We are only going to make the network call when we want to refresh the page
    ///Or when our list of transactions is empty
    if ((refreshList && _transactions.isNotEmpty) || _transactions.isEmpty) {
      ///If transaction list has data clear it before we make the network call
      ///we want to receive the latest data
      _transactions.clear();
      final _data = await _blocksServiceImpl.getBlockDetailsData(hash);
      if (_data != null) _transactions = _data.tx!;
    }
    return _transactions;
  }
}
