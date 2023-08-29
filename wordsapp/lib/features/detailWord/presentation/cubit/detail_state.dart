import '../../../home/data/models/word_model.dart';

abstract class DetailState {
  DetailState(this.data, this.message);

  final WordModel? data;
  final String? message;

  String get getMessage => message ?? "";

  WordModel? get getData => data;
}

class DetailInitState extends DetailState {
  DetailInitState() : super(null, null);
}

class DetailSuccess extends DetailState {
  DetailSuccess(super.data, super.message);
}

class DetailFailed extends DetailState {
  DetailFailed(super.data, super.message);
}

class DetailLoading extends DetailState {
  DetailLoading() : super(null, null);
}
