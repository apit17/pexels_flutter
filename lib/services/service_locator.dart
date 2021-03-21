import 'package:get_it/get_it.dart';
import 'package:pexels/screens/product_list/product_list_provider.dart';
import 'package:pexels/services/web_api/web_api.dart';
import 'package:pexels/services/web_api/web_api_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton<WebApi>(() => WebApiService());

  serviceLocator.registerFactory<ProductListProvider>(() => ProductListProvider());
}