import 'package:crypto_app/core/models/block_model.dart';
import 'package:crypto_app/core/services/block_service.dart';
import 'package:crypto_app/core/services/locator.dart';
import 'package:flutter/material.dart';

class BlockProvider extends ChangeNotifier {
  BlockServiceImpl _blocksServiceImpl = locator<BlockServiceImpl>();

  String? _errorMessage;
  String? get erroMessage => _errorMessage;

  BlockModel? _latestBlock;
  BlockModel? get latestBlock => _latestBlock;


  Future<void> geLatestBlock({bool referesh = false}) async {
    ///We are only going to make the network call when we want to refresh the page
    ///Or when we don't have a value for our latest block
    ///One advantage is that we can have a timer that forces users to refresh page when it elpases to get the latestBlock.
    if (referesh || _latestBlock == null) {
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
  }


}
