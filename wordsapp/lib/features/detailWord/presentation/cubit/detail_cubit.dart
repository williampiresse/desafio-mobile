import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/core_config.dart';
import '../../../historic/domain/usecases/salve_historic_usecase_interface.dart';
import '../../../home/data/models/word_model.dart';
import '../../domain/usecases/word_search_usecase_interface.dart';
import 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitState());

  static GetIt injector = CoreConfig.injector;

  final _wordSearchUserUsecaseInterface =
      injector<WordSearchUsecaseInterface>();
  final _saveHistoricUsecaseInterface =
      injector<SaveHistoricUsecaseInterface>();

  Future<void> requestWordDetail(List<WordModel> data, int index) async {
    WordModel wordModel = data[index];

    if (_isSearchCached(wordModel)) {
      return emit(DetailSuccess(wordModel, "Successful word detail"));
    } else {
      emit(DetailLoading());
      final result = await _wordSearchUserUsecaseInterface.call(
        wordModel.word,
        wordModel.id!,
      );
      setNewWordModel(data, result.data!, index);
      if (result.dataIsNotEmpty) {
        return emit(DetailSuccess(result.data, result.message));
      }
      return emit(DetailFailed(
        result.data,
        result.message,
      ));
    }
  }

  bool _isSearchCached(WordModel wordModel) {
    final isValidWordSearch = wordModel.isValidWordSearch ?? false;
    final hasDefinition = wordModel.hasDefinition ?? false;
    final hasPronunciation = wordModel.hasPronunciation ?? false;
    if (isValidWordSearch == false) {
      return true;
    }
    if (isValidWordSearch && (hasDefinition || hasPronunciation)) {
      return true;
    }
    return false;
  }

  void setNewWordModel(List<WordModel> data, WordModel wordModel, int index) {
    data[index].word = wordModel.word;
    data[index].hasDefinition = wordModel.hasDefinition;
    data[index].hasPronunciation = wordModel.hasPronunciation;
    data[index].isValidWordSearch = wordModel.isValidWordSearch;
    data[index].meaning = wordModel.meaning;
    data[index].pronunciation = wordModel.pronunciation;
  }

  Future<void> saveHistoric(WordModel wordModel) {
    return _saveHistoricUsecaseInterface.call(wordModel);
  }
}
