import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../data/models/sign_in_response_model.dart';
import '../repositories/sign_in_repository_interface.dart';
import 'sign_in_usecase_interface.dart';

class SignInUsecaseImpl implements SignInUsecaseInterface {
  static GetIt injector = CoreConfig.injector;

  final _signInRepositoryInterface = injector<SignInRepositoryInterface>();

  @override
  Future<ApiResponse<SignInResponseModel>> signInUser(String email, String password) async {
    return _signInRepositoryInterface.authenticate(email, password);
  }
}
