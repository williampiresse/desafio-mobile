import 'dart:convert';

import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/api/client_authorization.dart';
import '../../../../core/api/http_client.dart';
import '../../../../core/api/url_base_dictionary.dart';
import '../../../../core/core_config.dart';
import '../../../../core/enums/status_code.dart';
import '../../../../core/error/exception_custom.dart';
import '../../../../core/network/core_network_info.dart';
import '../models/word_model.dart';
import 'words_remote_datasource_interface.dart';

class WordsRemoteDatasourceImpl implements WordsRemoteDatasourceInterface {
  static GetIt injector = CoreConfig.injector;
  final _httpClient = injector<HttpClient>();
  final _clientAuthorization = injector<ClientAuthorization>();
  final networkInfo = injector<CoreNetworkInfoInterface>();

  final List<WordModel> _wordList = [];

  @override
  Future<ApiResponse<List<WordModel>>> getListWords([int page = 1]) async {

    if (!await networkInfo.checkConnectivity()) {
      return ApiResponse<List<WordModel>>(
        statusCodeEnum: StatusCodeEnum.networkError,
        isError: true,
        message: "Network not available",
      );
    }

    final headers = await _clientAuthorization.getAppDictionaryApi();
    var response = await _httpClient.get(
        "${Url.dictionary}/v1/wordsList?page=$page&limit=25",
        headers: headers);

    if (response.statusCode == 200) {
      final jsonParse = jsonDecode(response.body);
      final data = jsonParse["data"] as List;

      _wordList.addAll(data.map((item) {
        return WordModel.fromJson(item);
      }).toList());

      final apiResponse = ApiResponse<List<WordModel>>.apiResponse(jsonParse);
      apiResponse.data = _wordList;

      return apiResponse;
    } else {
      return throw ExceptionCustom(
        response.statusCode,
        message: response.reasonPhrase!,
      );
    }
  }
}
