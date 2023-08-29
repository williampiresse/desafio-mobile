import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/core_config.dart';
import '../../domain/usecases/check_logged_user_usecase_interface.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  static GetIt injector = CoreConfig.injector;

  final _checkLoggeUserUsecaseInterface =
      injector<CheckLoggedUserUsecaseInterface>();

  Future<bool> checkAuthUser() async {
    emit(SplashLoading());
    final result = await _checkLoggeUserUsecaseInterface.call();
    if (result.statusCode == 202) {
      emit(SplashSuccess(result.message));
      return true;
    }
    emit(SplashFailed(result.message));
    return false;
  }
}
