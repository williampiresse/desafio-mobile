abstract class SignInState {
  SignInState(this.message);

  final String? message;

  String get getMessage => message ?? "";
}

class SignInInitialState extends SignInState {
  SignInInitialState() : super(null);
}

class SignInSuccess extends SignInState {
  SignInSuccess(super.message);
}

class SingInFailed extends SignInState {
  SingInFailed(super.message);
}

class SingInLoading extends SignInState {
  SingInLoading() : super(null);
}
