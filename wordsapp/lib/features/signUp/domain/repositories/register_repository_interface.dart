import '../../../../core/api/api_response.dart';
import '../entities/register_entity.dart';

abstract class RegisterRepositoryInterface {
  Future<ApiResponse> registerUser(RegisterEntity registerEntity);
}
