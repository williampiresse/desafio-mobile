import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/core_config.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/usecases/register_user_usecase_interface.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  static GetIt injector = CoreConfig.injector;

  final _signUpUsecaseInterface = injector<RegisterUsecaseInterface>();

  Future<void> signUpUser({
    required final String email,
    required final String password,
    required final String name,
  }) async {
    final result = await _signUpUsecaseInterface.call(RegisterEntity(
      name: name,
      email: email,
      password: password,
    ));
    if (result.isSuccess) {
      return emit(SignUpSuccess(result.message));
    }
    return emit(SignUpFailed(result.message));
  }
}
