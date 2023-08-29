abstract class SharedPreferencesInterface {
  Future<bool> put(String key, Object value);
  Future<Object?> get(String key);
}