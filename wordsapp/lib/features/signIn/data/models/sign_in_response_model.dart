class SignInResponseModel {
  const SignInResponseModel({
    required this.token,
  });

  final String token;

  SignInResponseModel.fromJson(Map<String, dynamic> json)
      : token = json['data'] ?? '';

  @override
  String toString() {
    return 'SignInResponseModel{token: $token}';
  }
}