import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:legalkan/core/api/dio_config.dart';
import 'package:legalkan/utils/custom_navigator.dart';

import 'locator.config.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<NavigationCustom>(() => NavigationCustom());
  configureDependencies();
}

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() {
  $initGetIt(locator);
}

@module
abstract class AppModule {

  @lazySingleton
  Dio dio() => dioConfig();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

}