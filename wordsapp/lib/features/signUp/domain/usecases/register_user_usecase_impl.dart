import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../entities/register_entity.dart';
import '../repositories/register_repository_interface.dart';
import 'register_user_usecase_interface.dart';

class RegisterUsecaseImpl implements RegisterUsecaseInterface {
  static GetIt injector = CoreConfig.injector;

  final _registerRepositoryInterface = injector<RegisterRepositoryInterface>();

  @override
  Future<ApiResponse> call(RegisterEntity registerEntity) async {
    return _registerRepositoryInterface.registerUser(registerEntity);
  }
}
