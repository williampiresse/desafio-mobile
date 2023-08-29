import '../../../../core/api/api_response.dart';
import '../../data/models/sign_in_response_model.dart';

abstract class SignInRepositoryInterface {
  Future<ApiResponse<SignInResponseModel>> authenticate(final String email, final String password);
}