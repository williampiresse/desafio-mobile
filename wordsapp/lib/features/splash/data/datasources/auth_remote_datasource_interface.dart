
import '../../../../core/api/api_response.dart';

abstract class AuthRemoteDatasourceInterface {
  Future<ApiResponse> get();
}
