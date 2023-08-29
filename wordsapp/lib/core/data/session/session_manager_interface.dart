abstract class SessionManagerInterface {
  Future<String> getApiDictionaryKey();

  Future<bool> setApiDictionaryKey(String value);
}
