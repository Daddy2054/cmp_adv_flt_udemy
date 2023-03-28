import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/app/app_prefs.dart';
import '/data/data_source/remote_data_source.dart';
import '/data/network/app_api.dart';
import '/data/network/dio_factory.dart';
import '/data/network/network_info.dart';
import '/data/repository/repository_impl.dart';
import '/domain/repository/repository.dart';
import '/domain/usecase/login_usecase.dart';
import '/presentation/login/login_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

//shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPrefs,
  );

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(
      instance(),
    ),
  );
//network info
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      DataConnectionChecker(),
    ),
  );

//dio factory
  instance.registerLazySingleton<DioFactory>(
    () => DioFactory(
      instance(),
    ),
  );

//app service class

  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(
    () => AppServiceClient(
      dio,
    ),
  );

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementer(
      instance(),
    ),
  );

  //repository
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      instance(),
      instance(),
    ),
  );
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
      () => LoginUseCase(
        instance(),
      ),
    );
    instance.registerFactory<LoginViewModel>(
      () => LoginViewModel(
        instance(),
      ),
    );
  }
}
