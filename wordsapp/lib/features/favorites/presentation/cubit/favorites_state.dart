import '../../../home/data/models/word_model.dart';

abstract class FavoritesState {
  FavoritesState(
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

class FavoritesInitState extends FavoritesState {
  FavoritesInitState() : super([], null, 1, true);
}

class FavoritesSuccess extends FavoritesState {
  FavoritesSuccess(
    super.data,
    super.message,
    super.currentPage,
    super.hasReachedMax,
  );
}

class FavoritesFailed extends FavoritesState {
  FavoritesFailed(message) : super([], message, 1, true);
}

class FavoritesLoading extends FavoritesState {
  FavoritesLoading() : super([], null, 1, true);
}
