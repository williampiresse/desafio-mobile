import 'package:http/http.dart' as http;

class HttpClient {

  HttpClient._internal();

  static final HttpClient _singleton = HttpClient._internal();

  static HttpClient get instance => _singleton;

  final _httpClient = http.Client();

  Future<http.Response> post(String url, {Map<String, String>? headers, Object? body}) async {
    return _httpClient.post(Uri.parse(url), headers: headers, body: body);
  }

  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    return _httpClient.get(Uri.parse(url), headers: headers);
  }
}