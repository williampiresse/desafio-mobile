import '../../../../core/api/api_response.dart';

abstract class CheckLoggedUserUsecaseInterface {
  Future<ApiResponse> call();
}
