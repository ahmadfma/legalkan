// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

import 'core/api/activity_api.dart' as _i4;
import 'core/api/activity_type_api.dart' as _i6;
import 'core/api/document_api.dart' as _i8;
import 'core/api/dosen_api.dart' as _i10;
import 'core/api/matakuliah_api.dart' as _i12;
import 'core/api/notification_api.dart' as _i14;
import 'core/api/testimoni_api.dart' as _i16;
import 'core/api/user_api.dart' as _i18;
import 'core/local/local_datasource.dart' as _i21;
import 'core/repository/activity_repository.dart' as _i5;
import 'core/repository/activity_type_repository.dart' as _i7;
import 'core/repository/document_api_repository.dart' as _i9;
import 'core/repository/dosen_repository.dart' as _i11;
import 'core/repository/matakuliah_repository.dart' as _i13;
import 'core/repository/notification_repository.dart' as _i15;
import 'core/repository/testimoni_repository.dart' as _i17;
import 'core/repository/user_repository.dart' as _i19;
import 'locator.dart' as _i22;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.Dio>(() => appModule.dio());
  gh.lazySingleton<_i4.IActivityApi>(() => _i4.ActivityApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i5.IActivityRepository>(
      () => _i5.ActivityRepository(gh<_i4.IActivityApi>()));
  gh.lazySingleton<_i6.IActivityTypeApi>(
      () => _i6.ActivityTypeApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i7.IActivityTypeRepository>(
      () => _i7.ActivityTypeRepository(gh<_i6.IActivityTypeApi>()));
  gh.lazySingleton<_i8.IDocumentApi>(() => _i8.DocumentApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i9.IDocumentApiRepository>(
      () => _i9.DocumentApiRepository(gh<_i8.IDocumentApi>()));
  gh.lazySingleton<_i10.IDosenApi>(() => _i10.DosenApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i11.IDosenRepository>(
      () => _i11.DosenRepository(gh<_i10.IDosenApi>()));
  gh.lazySingleton<_i12.IMatakuliahApi>(
      () => _i12.MatakuliahApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i13.IMatakuliahRepository>(
      () => _i13.MatakuliahRepository(gh<_i12.IMatakuliahApi>()));
  gh.lazySingleton<_i14.INotificationApi>(
      () => _i14.NotificationApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i15.INotificationRepository>(
      () => _i15.NotificationRepository(gh<_i14.INotificationApi>()));
  gh.lazySingleton<_i16.ITestimoniApi>(() => _i16.TestimoniApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i17.ITestimoniRepository>(
      () => _i17.TestimoniRepository(gh<_i16.ITestimoniApi>()));
  gh.lazySingleton<_i18.IUserApi>(() => _i18.UserApi(gh<_i3.Dio>()));
  gh.lazySingleton<_i19.IUserRepository>(
      () => _i19.UserRepository(gh<_i18.IUserApi>()));
  await gh.factoryAsync<_i20.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i21.ILocalDataSource>(
      () => _i21.LocalDataSource(gh<_i20.SharedPreferences>()));
  return getIt;
}

class _$AppModule extends _i22.AppModule {}
