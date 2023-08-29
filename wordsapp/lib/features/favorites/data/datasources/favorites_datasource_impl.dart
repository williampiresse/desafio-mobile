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
import '../../../home/data/models/word_model.dart';
import 'favorites_datasource_interface.dart';

class FavoritesDatasourceImpl implements FavoritesDatasourceInterface {
  static GetIt injector = CoreConfig.injector;
  final _httpClient = injector<HttpClient>();
  final _clientAuthorization = injector<ClientAuthorization>();
  final networkInfo = injector<CoreNetworkInfoInterface>();

  final List<WordModel> _wordList = [];

  @override
  Future<ApiResponse<List<WordModel>>> getFavorites([int page = 1]) async {
    if (!await networkInfo.checkConnectivity()) {
      return ApiResponse<List<WordModel>>(
        statusCodeEnum: StatusCodeEnum.networkError,
        isError: true,
        message: "Network not available",
      );
    }

    final headers = await _clientAuthorization.getAppDictionaryApi();
    final response = await _httpClient.get(
        "${Url.dictionary}/v1/favorites?page=$page&limit=25",
        headers: headers);

    if (response.statusCode == 200) {
      final jsonParse = jsonDecode(response.body);
      final data = jsonParse["data"] as List;

      final apiResponse = ApiResponse<List<WordModel>>.apiResponse(jsonParse);

      if (apiResponse.isSuccess) {
        _wordList.addAll(data.map((item) {
          return WordModel.fromJson(item);
        }).toList());
      }

      apiResponse.data = _wordList;

      return apiResponse;
    } else {
      return throw ExceptionCustom(
        response.statusCode,
        message: response.reasonPhrase!,
      );
    }
  }

  @override
  Future<bool> save(WordModel word) async {
    final params = jsonEncode(word.toJson());
    final headers = await _clientAuthorization.getAppDictionaryApi();
    final response = await _httpClient.post(
        "${Url.dictionary}/v1/favorite/create",
        headers: headers,
        body: params);

    if (response.statusCode == 200) {
      final jsonParse = jsonDecode(response.body);

      final apiResponse = ApiResponse.apiResponse(jsonParse);

      if (apiResponse.statusCode == 201) {
        return true;
      }
      return false;
    } else {
      return throw ExceptionCustom(
        response.statusCode,
        message: response.reasonPhrase!,
      );
    }
  }
}
