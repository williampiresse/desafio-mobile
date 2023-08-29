class SignInEntity {
  const SignInEntity({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  String toString() {
    return 'SignInEntity{email: $email, password: $password}';
  }
}
