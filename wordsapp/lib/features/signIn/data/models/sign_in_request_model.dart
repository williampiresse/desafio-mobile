class SignInRequestModel {
  const SignInRequestModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  SignInRequestModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };

  @override
  String toString() {
    return 'SignInModel{email: $email, password: $password}';
  }
}