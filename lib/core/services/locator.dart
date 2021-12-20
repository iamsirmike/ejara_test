import 'package:crypto_app/core/services/block_service.dart';
import 'package:crypto_app/utils/network_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => CustomHttpClient());
  locator.registerLazySingleton(() => BlockService());
}
