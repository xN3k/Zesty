import 'package:zesty/repository/product/product_repository.dart';
import 'package:zesty/repository/user/user_http_repository.dart';
import 'package:zesty/repository/user/user_repo.dart';

import 'dependency_injection.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void serviceLocator() {
    getIt.registerLazySingleton<UserRepo>(() => UserHttpRepository());
    getIt.registerLazySingleton<ProductApiRepository>(
        () => ProductHttpApiRepository());
  }
}
