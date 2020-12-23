import 'package:get_it/get_it.dart';
import 'package:two_bill/ViewModels/auth_view_model.dart';
import 'package:two_bill/utils/AppLanguage.dart';


import 'api.dart';
import 'authentication_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerFactory(() => Api());
  locator.registerLazySingleton(() => AppLanguage());
  locator.registerFactory(() => AuthViewModel());
}
