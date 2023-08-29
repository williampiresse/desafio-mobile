
import 'header_config_interface.dart';

class HeaderConfigImpl implements HeaderConfigInterface {
  HeaderConfigImpl._internal();

  static final HeaderConfigImpl _singleton = HeaderConfigImpl._internal();

  static HeaderConfigImpl get instance => _singleton;

  @override
  Map<String, String> getWordsApi(String apiKey) {
    return {
      "X-RapidAPI-Key": apiKey,
      "Content-type": "application/json",
      "Accept": "application/json"
    };
  }

  @override
  Map<String, String> getAppDictionaryApi(String apiKey) {
    return {
      "x-access-token": apiKey,
      "Content-type": "application/json",
      "Accept": "application/json"
    };
  }
}
