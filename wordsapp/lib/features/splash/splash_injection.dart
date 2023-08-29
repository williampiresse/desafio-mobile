import 'package:get_it/get_it.dart';

import 'data/datasources/auth_remote_datasource_impl.dart';
import 'data/datasources/auth_remote_datasource_interface.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_respository_interface.dart';
import 'domain/usecases/check_logged_user_usecase_impl.dart';
import 'domain/usecases/check_logged_user_usecase_interface.dart';
import 'presentation/cubit/splash_cubit.dart';

class SplashInjection {
  SplashInjection(this.injector);

  final GetIt injector;
  static SplashInjection? _defaultInstance;

  static SplashInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = SplashInjection(getIt);
  }

  Future<void> build() async {
    injector.registerLazySingleton<AuthRemoteDatasourceInterface>(
      () => AuthRemoteDatasourceImpl(),
    );
    injector.registerSingleton<AuthRepositoryInterface>(
      AuthRepositoryImpl(),
    );

    injector.registerSingleton<CheckLoggedUserUsecaseInterface>(
      CheckLoggedUserUsecaseImpl(),
    );

    injector.registerSingleton<SplashCubit>(
      SplashCubit(),
    );
  }
}
