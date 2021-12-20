import 'package:crypto_app/core/models/block_model.dart';
import 'package:crypto_app/core/models/transactions_model.dart';
import 'package:crypto_app/core/services/block_service.dart';
import 'package:crypto_app/core/services/locator.dart';
import 'package:flutter/material.dart';

class BlockProvider extends ChangeNotifier {
  BlockServiceImpl _blocksServiceImpl = locator<BlockServiceImpl>();

  String? _errorMessage;
  String? get erroMessage => _errorMessage;

  BlockModel? _latestBlock;
  BlockModel? get latestBlock => _latestBlock;

  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  Future<void> geLatestBlock() async {
    try {
      final _data = await _blocksServiceImpl.getLatestBlockData();
      //exit early when data is null
      if (_data == null) return;
      _latestBlock = _data;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> getTransactions(String hash) async {
    try {
      final _data = await _blocksServiceImpl.getBlockDetailsData(hash);
      //exit early when data is null
      if (_data == null) return;
      _transactions = _data.tx!;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    }
  }
}
