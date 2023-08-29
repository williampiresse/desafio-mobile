abstract class SignUpState {
  SignUpState(this.message);

  final String? message;

  String get getMessage => message ?? "";
}

class SignUpInitialState extends SignUpState {
  SignUpInitialState() : super(null);
}

class SignUpSuccess extends SignUpState {
  SignUpSuccess(super.message);
}

class SignUpFailed extends SignUpState {
  SignUpFailed(super.message);
}

class SignUpLoading extends SignUpState {
  SignUpLoading() : super(null);
}
