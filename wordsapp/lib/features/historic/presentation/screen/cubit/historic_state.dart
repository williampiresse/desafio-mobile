import '../../../../home/data/models/word_model.dart';

abstract class HistoricState {
  HistoricState(
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

class HistoricInitState extends HistoricState {
  HistoricInitState() : super([], null, 1, true);
}

class HistoricSuccess extends HistoricState {
  HistoricSuccess(
    super.data,
    super.message,
    super.currentPage,
    super.hasReachedMax,
  );
}

class HistoricFailed extends HistoricState {
  HistoricFailed(message) : super([], message, 1, true);
}

class HistoricLoading extends HistoricState {
  HistoricLoading() : super([], null, 1, true);
}
