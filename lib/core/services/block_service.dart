import 'package:crypto_app/core/models/block_details_model.dart';
import 'package:crypto_app/core/models/block_model.dart';
import 'package:crypto_app/core/services/locator.dart';
import 'package:crypto_app/utils/endpoints.dart';
import 'package:crypto_app/utils/network_client.dart';

abstract class BlockService {
  Future<BlockModel?> getLatestBlockData();
  Future<BlockDetailsModel?> getBlockDetailsData(String hash);
}

class BlockServiceImpl implements BlockService {
  CustomHttpClient httpService = locator<CustomHttpClient>();

  @override
  Future<BlockModel?> getLatestBlockData() async {
    final response = await httpService.get(getLatestBlock);
    if (httpService.isSuccessful(response)) {
      final _data = httpService.getResponseBody(response);
      return BlockModel.fromJson(_data);
    }
    return null;
  }

  @override
  Future<BlockDetailsModel?> getBlockDetailsData(String hash) async {
    final response = await httpService.get('$getBlockTransaction/$hash');
    if (httpService.isSuccessful(response)) {
      final _data = httpService.getResponseBody(response);
      return BlockDetailsModel.fromJson(_data);
    }
    return null;
  }
}
