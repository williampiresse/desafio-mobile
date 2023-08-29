import 'package:get_it/get_it.dart';

import '../core_config.dart';
import '../data/session/session_manager_interface.dart';
import 'header_config_interface.dart';

class ClientAuthorization {
  ClientAuthorization();

  static GetIt injector = CoreConfig.injector;

  final _sessionManagerInterface = injector<SessionManagerInterface>();
  final _headerConfigInterface = injector<HeaderConfigInterface>();

  Future<Map<String, String>> getWordsApi() async {
    return _headerConfigInterface
        .getWordsApi("49263a8736msh310c58d5622a1c3p18c084jsn8efc73d17a1e");
  }

  Future<Map<String, String>> getAppDictionaryApi() async {
    final key = await _sessionManagerInterface.getApiDictionaryKey();
    return _headerConfigInterface.getAppDictionaryApi(key);
  }
}
