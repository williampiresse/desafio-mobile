import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../domain/repositories/auth_respository_interface.dart';
import '../datasources/auth_remote_datasource_interface.dart';

class AuthRepositoryImpl implements AuthRepositoryInterface {
  static GetIt injector = CoreConfig.injector;
  final _authRemoteDatasource = injector<AuthRemoteDatasourceInterface>();

  @override
  Future<ApiResponse> checkLoggedUser() async {
    return _authRemoteDatasource.get();
  }
}
