class RegisterResponseModel {
  const RegisterResponseModel({
    required this.token,
  });

  final String token;

  RegisterResponseModel.fromJson(Map<String, dynamic> json)
      : token = json['data'] ?? '';

  @override
  String toString() {
    return 'RegisterResponseModel{token: $token}';
  }
}