import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../../core/error/exception_custom.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/register_repository_interface.dart';
import '../datasources/sign_up_datasource_interface.dart';
import '../models/register_response_model.dart';

class RegisterRepositoryImpl implements RegisterRepositoryInterface {
  static GetIt injector = CoreConfig.injector;
  final _registerDatasource = injector<SignUpDatasourceInterface>();

  @override
  Future<ApiResponse<RegisterResponseModel>> registerUser(RegisterEntity registerEntity) async {
    try {
      return _registerDatasource.register(registerEntity);
    } on ExceptionCustom catch (err) {
      return ApiResponse<RegisterResponseModel>(isError: true, message: err.message);
    }
  }
}
