import '../enums/status_code.dart';

class ApiResponse<Data> {
  ApiResponse({
    this.message,
    this.data,
    required this.isError,
    this.statusCode,
    this.statusCodeEnum,
  });

  final String? message;
  late Data? data;
  final bool isError;
  final int? statusCode;
  final StatusCodeEnum? statusCodeEnum;

  factory ApiResponse.fromJson(Map<String, dynamic> json,
      Data Function(Map<String, dynamic>) fromJsonData) {
    return ApiResponse<Data>(
      data: fromJsonData(json),
      message: json['message'],
      statusCode: json['status_code'],
      isError: json['is_error'],
      statusCodeEnum: StatusCodeEnum.getById(json['status_code']),
    );
  }

  factory ApiResponse.apiResponse(Map<String, dynamic> json) {
    return ApiResponse<Data>(
      message: json['message'],
      statusCode: json['status_code'],
      isError: json['is_error'],
      statusCodeEnum: StatusCodeEnum.getById(json['status_code']),
    );
  }

  bool get isEmptyData => statusCodeEnum == StatusCodeEnum.isEmpty;

  bool get isPasswordMustBeFourCharactersLong =>
      statusCodeEnum == StatusCodeEnum.passwordMustBeFourCharactersLong;

  bool get loginIsNotRegistered =>
      statusCodeEnum == StatusCodeEnum.loginIsNotRegistered;

  bool get bodyIsEmpty => statusCodeEnum == StatusCodeEnum.bodyIsEmpty;

  bool get invalidEmailOrPassword =>
      statusCodeEnum == StatusCodeEnum.invalidEmailOrPassword;

  bool get isInvalidEmail => statusCodeEnum == StatusCodeEnum.invalidEmail;

  bool get isInternalServerError =>
      statusCodeEnum == StatusCodeEnum.internalServerError;

  bool get isReceived => statusCodeEnum == StatusCodeEnum.isReceived;

  bool get isSuccess => statusCodeEnum == StatusCodeEnum.success;

  bool get dataIsNotEmpty => statusCodeEnum == StatusCodeEnum.dataIsNotEmpty;

  bool get dataIsEmpty => statusCodeEnum == StatusCodeEnum.dataIsEmpty;

  bool get isEmailIsAlreadyRegistered =>
      statusCodeEnum == StatusCodeEnum.emailIsAlreadyRegistered;

  bool get isUnknown => statusCodeEnum == StatusCodeEnum.unknown;

  @override
  String toString() {
    return 'ApiResponse{message: $message, data: $data, isError: $isError, statusCode: $statusCode}';
  }
}
