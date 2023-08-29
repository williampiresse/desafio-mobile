import 'package:wordsapp/core/api/api_response.dart';

import '../entities/register_entity.dart';

abstract class RegisterUsecaseInterface {
  Future<ApiResponse> call(RegisterEntity registerEntity);
}
