import '../../../../core/api/api_response.dart';

abstract class AuthRepositoryInterface {
  Future<ApiResponse> checkLoggedUser();
}
