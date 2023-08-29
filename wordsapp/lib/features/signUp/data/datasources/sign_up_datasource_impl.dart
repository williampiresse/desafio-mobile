import 'dart:convert';

import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/client_authorization.dart';
import '../../../../core/api/http_client.dart';
import '../../../../core/api/url_base_dictionary.dart';
import '../../../../core/core_config.dart';
import '../../../../core/data/session/session_manager_interface.dart';
import '../../../../core/enums/status_code.dart';
import '../../../../core/error/exception_custom.dart';
import '../../../../core/network/core_network_info.dart';
import '../../domain/entities/register_entity.dart';
import '../models/register_response_model.dart';
import 'sign_up_datasource_interface.dart';

class SignUpDatasourceImpl implements SignUpDatasourceInterface {
  static GetIt injector = CoreConfig.injector;
  final _httpClient = injector<HttpClient>();
  final _clientAuthorization = CoreConfig.injector<ClientAuthorization>();
  final _sessionManagerInterface = injector<SessionManagerInterface>();
  final networkInfo = injector<CoreNetworkInfoInterface>();

  @override
  Future<ApiResponse<RegisterResponseModel>> register(
    RegisterEntity registerEntity,
  ) async {
    if (!await networkInfo.checkConnectivity()) {
      return ApiResponse<RegisterResponseModel>(
        statusCodeEnum: StatusCodeEnum.networkError,
        isError: true,
        message: "Network not available",
      );
    }

    final headers = await _clientAuthorization.getAppDictionaryApi();
    final params = jsonEncode(registerEntity.toJson());
    final response = await _httpClient.post("${Url.dictionary}/v1/user/create",
        headers: headers, body: params);

    if (response.statusCode == 200) {
      var jsonParse = jsonDecode(response.body);

      final apiResponse = ApiResponse<RegisterResponseModel>.fromJson(
          jsonParse, RegisterResponseModel.fromJson);

      if (apiResponse.isSuccess) {
        await _sessionManagerInterface
            .setApiDictionaryKey(apiResponse.data!.token);
      }
      return apiResponse;
    } else {
      return throw ExceptionCustom(
        response.statusCode,
        message: response.reasonPhrase!,
      );
    }
  }
}
