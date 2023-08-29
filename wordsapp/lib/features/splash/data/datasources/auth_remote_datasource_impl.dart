import 'dart:convert';

import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/client_authorization.dart';
import '../../../../core/api/http_client.dart';
import '../../../../core/api/url_base_dictionary.dart';
import '../../../../core/core_config.dart';
import 'auth_remote_datasource_interface.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasourceInterface {
  static GetIt injector = CoreConfig.injector;
  final _httpClient = injector<HttpClient>();
  final _clientAuthorization = injector<ClientAuthorization>();

  @override
  Future<ApiResponse> get() async {
    try {
      final headers = await _clientAuthorization.getAppDictionaryApi();

      var response = await _httpClient.get("${Url.dictionary}/v1/user/islogged",
          headers: headers);
      if (response.statusCode == 200) {
        return ApiResponse.apiResponse(jsonDecode(response.body));
      } else {
        return ApiResponse(
            message: "Falha de autenticação!",
            isError: false,
            statusCode: response.statusCode);
      }
    } catch (error) {
      return ApiResponse(message: "$error", isError: true, statusCode: 999);
    }
  }
}
