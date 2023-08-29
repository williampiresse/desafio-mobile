import 'package:get_it/get_it.dart';

import 'data/datasources/sign_up_datasource_impl.dart';
import 'data/datasources/sign_up_datasource_interface.dart';
import 'data/repositories/register_repository_impl.dart';
import 'domain/repositories/register_repository_interface.dart';
import 'domain/usecases/register_user_usecase_impl.dart';
import 'domain/usecases/register_user_usecase_interface.dart';
import 'presentation/cubit/sign_up_cubit.dart';

class SignUpInjection {
  SignUpInjection(this.injector);

  final GetIt injector;
  static SignUpInjection? _defaultInstance;

  static SignUpInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = SignUpInjection(getIt);
  }

  Future<void> build() async {
    injector.registerLazySingleton<SignUpDatasourceInterface>(
        () => SignUpDatasourceImpl());

    injector.registerLazySingleton<RegisterRepositoryInterface>(
        () => RegisterRepositoryImpl());

    injector.registerLazySingleton<RegisterUsecaseInterface>(
        () => RegisterUsecaseImpl());

    injector.registerLazySingleton(() => SignUpCubit());
  }
}
