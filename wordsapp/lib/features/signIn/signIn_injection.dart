import 'package:get_it/get_it.dart';

import 'data/repositories/sign_in_repository_impl.dart';
import 'domain/repositories/sign_in_repository_interface.dart';
import 'domain/usecases/sign_in_usecase_impl.dart';
import 'domain/usecases/sign_in_usecase_interface.dart';
import 'presentation/cubit/sign_in_cubit.dart';

class SignInInjection {
  SignInInjection(this.injector);

  final GetIt injector;
  static SignInInjection? _defaultInstance;

  static SignInInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = SignInInjection(getIt);
  }

  Future<void> build() async {
    injector.registerLazySingleton<SignInRepositoryInterface>(
        () => SignInRepositoryImpl());

    injector.registerLazySingleton<SignInUsecaseInterface>(
        () => SignInUsecaseImpl());

    injector.registerLazySingleton(() => SignInCubit());
  }
}
