import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core_config.dart';
import 'shared_preferences_interface.dart';

class SharedPreferencesImpl implements SharedPreferencesInterface {
  static GetIt injector = CoreConfig.injector;

  final _preferences = injector<SharedPreferences>();

  @override
  Future<Object?> get(String key) async {
    return _preferences.get(key);
  }

  @override
  Future<bool> put(String key, Object value) async {
    if (value is int) {
      return _preferences.setInt(key, value);
    }
    if (value is bool) {
      return _preferences.setBool(key, value);
    }
    if (value is double) {
      return _preferences.setDouble(key, value);
    }
    if (value is String) {
      return _preferences.setString(key, value);
    }
    return false;
  }
}
