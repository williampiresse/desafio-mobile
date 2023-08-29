import 'package:get_it/get_it.dart';

import '../../core_config.dart';
import '../preferences/shared_preferences_interface.dart';
import 'session_manager_interface.dart';

class SessionManagerImpl implements SessionManagerInterface {
  static GetIt injector = CoreConfig.injector;
  final _sharePreferenceInterface = injector<SharedPreferencesInterface>();

  final _key = "br.com.dictionary.AUTHORIZATION";

  @override
  Future<String> getApiDictionaryKey() async {
    final value = await _sharePreferenceInterface.get(_key);
    return value == null ? "" : value as String;
  }

  @override
  Future<bool> setApiDictionaryKey(String value) async {
    return _sharePreferenceInterface.put(_key, value);
  }
}
