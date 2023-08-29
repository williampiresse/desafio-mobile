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
import 'word_ search_datasource_interface.dart';

class WordSearchDatasourceImpl implements WordSearchDatasourceInterface {
  static GetIt injector = CoreConfig.injector;
  final _httpClient = injector<HttpClient>();
  final clientAuthorization = CoreConfig.injector<ClientAuthorization>();
  final networkInfo = injector<CoreNetworkInfoInterface>();

  @override
  Future<ApiResponse<WordModel>> search(String word) async {

    if (!await networkInfo.checkConnectivity()) {
      return ApiResponse<WordModel>(
        statusCodeEnum: StatusCodeEnum.networkError,
        isError: true,
        message: "Network not available",
      );
    }

    final header = await clientAuthorization.getWordsApi();
    final response = await _httpClient
        .get("https://wordsapiv1.p.rapidapi.com/words/$word", headers: header);

    try {
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
        if (response.statusCode == 404) {
          return ApiResponse<WordModel>(
              data: WordModel(
                  word: word,
                  meaning: "Meaning not found!",
                  pronunciation: "Pronunciation not found!",
                  isValidWordSearch: false,
                  hasDefinition: true,
                  hasPronunciation: true),
              statusCode: response.statusCode,
              isError: false);
        }
        if (jsonResponse["results"] != null) {
          final result = jsonResponse["results"][0];
          final data = jsonResponse["pronunciation"] as Map<String, dynamic>;
          return ApiResponse<WordModel>(
              data: WordModel(
                  word: word,
                  meaning: result["definition"],
                  pronunciation: data["all"],
                  isValidWordSearch: true,
                  hasDefinition: true,
                  hasPronunciation: true),
              statusCode: response.statusCode,
              isError: false);
        }
        return ApiResponse<WordModel>(
            data: WordModel(
                word: word,
                meaning: "Meaning not found!",
                pronunciation: "Pronunciation not found!",
                isValidWordSearch: false,
                hasDefinition: false,
                hasPronunciation: false),
            statusCode: response.statusCode,
            isError: false);
      }
    } catch (e) {
      if (response.statusCode == 404) {
        return ApiResponse<WordModel>(
            data: WordModel(
                word: word,
                meaning: "Meaning not found!",
                pronunciation: "Pronunciation not found!",
                isValidWordSearch: false,
                hasDefinition: false,
                hasPronunciation: false),
            statusCode: response.statusCode,
            isError: false);
      }
    }
    return ApiResponse<WordModel>(
        data: WordModel(
            word: word,
            meaning: "Meaning not found!",
            pronunciation: "Pronunciation not found!",
            isValidWordSearch: false,
            hasDefinition: false,
            hasPronunciation: false),
        statusCode: 999,
        isError: false);
  }

  @override
  Future<ApiResponse<bool>> save(WordModel word) async {
    final params = jsonEncode(word.toJson());
    final headers = await clientAuthorization.getAppDictionaryApi();
    final response = await _httpClient.post(
      "${Url.dictionary}/v1/words-details/create",
      headers: headers,
      body: params,
    );

    if (response.statusCode == 200) {
      final jsonParse = jsonDecode(response.body);
      return ApiResponse<bool>.apiResponse(jsonParse);
    } else {
      return throw ExceptionCustom(
        response.statusCode,
        message: response.reasonPhrase!,
      );
    }
  }
}
