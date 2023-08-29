class ExceptionCustom implements Exception {
  ExceptionCustom(
    int statusCode, {
    required this.message,
  });

  late int? statusCode;
  final String message;

  @override
  String toString() {
    return 'ExceptionCustom{statusCode: $statusCode, message: $message}';
  }
}
