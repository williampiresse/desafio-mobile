import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/core_config.dart';
import '../../domain/usecases/sign_in_usecase_interface.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitialState());

  static GetIt injector = CoreConfig.injector;

  final _signInUsecaseInterface = injector<SignInUsecaseInterface>();

  Future<bool> signInUser({
    required final String email,
    required final String password,
  }) async {
    emit(SingInLoading());
    final result = await _signInUsecaseInterface.signInUser(email, password);

    if (!result.isError) {
      emit(SignInSuccess(result.message));
      return true;
    }
    emit(SingInFailed(result.message));
    return false;
  }
}
