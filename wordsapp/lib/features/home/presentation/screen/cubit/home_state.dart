import '../../../data/models/word_model.dart';

abstract class HomeState {
  HomeState(
    this.data,
    this.message,
    this.currentPage,
    this.hasReachedMax,
  );

  final List<WordModel> data;
  final String? message;
  final int? currentPage;
  final bool? hasReachedMax;

  String get getMessage => message ?? "";

  int get getCurrentPage => currentPage ?? 1;

  bool get isHasReachedMax => hasReachedMax ?? true;

  List<WordModel> get getData => data;
}

class HomeInitState extends HomeState {
  HomeInitState() : super([], null, 1, true);
}

class HomeSuccess extends HomeState {
  HomeSuccess(
    super.data,
    super.message,
    super.currentPage,
    super.hasReachedMax,
  );
}

class HomeFailed extends HomeState {
  HomeFailed(message) : super([], message, 1, true);
}

class HomeLoading extends HomeState {
  HomeLoading() : super([], null, 1, true);
}
