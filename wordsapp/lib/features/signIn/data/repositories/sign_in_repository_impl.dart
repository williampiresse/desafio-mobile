import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:wordsapp/core/enums/status_code.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/client_authorization.dart';
import '../../../../core/api/http_client.dart';
import '../../../../core/api/url_base_dictionary.dart';
import '../../../../core/core_config.dart';
import '../../../../core/data/session/session_manager_interface.dart';
import '../../../../core/error/exception_custom.dart';
import '../../../../core/network/core_network_info.dart';
import '../../domain/repositories/sign_in_repository_interface.dart';
import '../models/sign_in_request_model.dart';
import '../models/sign_in_response_model.dart';

class SignInRepositoryImpl implements SignInRepositoryInterface {
  static GetIt injector = CoreConfig.injector;
  final _httpClient = injector<HttpClient>();
  final _sessionManagerInterface = injector<SessionManagerInterface>();
  final _clientAuthorization = injector<ClientAuthorization>();

  final networkInfo = injector<CoreNetworkInfoInterface>();

  @override
  Future<ApiResponse<SignInResponseModel>> authenticate(
    String email,
    String password,
  ) async {
    final signInJson = jsonEncode(SignInRequestModel(
      email: email,
      password: password,
    ).toJson());

    final isNetworkAvailable = await networkInfo.checkConnectivity();
    if (!isNetworkAvailable) {
      return ApiResponse<SignInResponseModel>(
        statusCodeEnum: StatusCodeEnum.networkError,
        isError: true,
        message: "Network not available",
      );
    }

    final headers = await _clientAuthorization.getAppDictionaryApi();

    final responseUserLogin = await _httpClient.post(
      "${Url.dictionary}/v1/user/login",
      body: signInJson,
      headers: headers,
    );

    if (responseUserLogin.statusCode == 200) {
      final responseUserLoginBody = jsonDecode(responseUserLogin.body);
      final apiResponse = ApiResponse<SignInResponseModel>.fromJson(
          responseUserLoginBody, SignInResponseModel.fromJson);

      if (apiResponse.isSuccess) {
        await _sessionManagerInterface
            .setApiDictionaryKey(apiResponse.data!.token);
      }
      return apiResponse;
    }
    return throw ExceptionCustom(
      responseUserLogin.statusCode,
      message: responseUserLogin.reasonPhrase!,
    );
  }
}
