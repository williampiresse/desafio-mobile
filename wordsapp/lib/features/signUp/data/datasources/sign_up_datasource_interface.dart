
import '../../../../core/api/api_response.dart';
import '../../domain/entities/register_entity.dart';
import '../models/register_response_model.dart';

abstract class SignUpDatasourceInterface {
  Future<ApiResponse<RegisterResponseModel>> register(RegisterEntity registerEntity);
}
