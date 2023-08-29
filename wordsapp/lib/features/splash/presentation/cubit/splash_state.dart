abstract class SplashState {
  SplashState(this.message);

  final String? message;

  String get getMessage => message ?? "";
}

class SplashInitialState extends SplashState {
  SplashInitialState() : super(null);
}

class SplashSuccess extends SplashState {
  SplashSuccess(super.message);
}

class SplashFailed extends SplashState {
  SplashFailed(super.message);
}

class SplashLoading extends SplashState {
  SplashLoading() : super(null);
}
