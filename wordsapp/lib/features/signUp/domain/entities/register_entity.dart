class RegisterEntity {
  RegisterEntity({
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
  };

  @override
  String toString() {
    return 'RegisterEntity{name: $name, email: $email, password: $password}';
  }
}
