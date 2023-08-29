import '../../../../core/api/api_response.dart';
import '../../data/models/sign_in_response_model.dart';

abstract class SignInUsecaseInterface {
  Future<ApiResponse<SignInResponseModel>> signInUser(final String email, final String password);
}