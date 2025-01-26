import 'package:zesty/repository/product/product_repository.dart';

import 'dependency_injection.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void serviceLocator() {
    getIt.registerLazySingleton<ProductApiRepository>(
      () => ProductHttpApiRepository(),
    );
  }
}
