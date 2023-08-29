import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../repositories/auth_respository_interface.dart';
import 'check_logged_user_usecase_interface.dart';

class CheckLoggedUserUsecaseImpl implements CheckLoggedUserUsecaseInterface {
  static GetIt injector = CoreConfig.injector;

  final _authRepositoryInterface = injector<AuthRepositoryInterface>();

  @override
  Future<ApiResponse> call() {
    return _authRepositoryInterface.checkLoggedUser();
  }
}
