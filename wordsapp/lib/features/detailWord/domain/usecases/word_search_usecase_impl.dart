import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../home/data/models/word_model.dart';
import '../repositories/word_search_repository_interface.dart';
import 'word_search_usecase_interface.dart';

class WordSearchUsecaseImpl implements WordSearchUsecaseInterface {
  static GetIt injector = CoreConfig.injector;
  final _searchRepository = injector<WordSearchRepositoryInterface>();

  @override
  Future<ApiResponse<WordModel>> call(String word, int wordId) async {
    var resultSearchWord = await _searchRepository.search(word);
    resultSearchWord.data!.id = wordId;
    await save(resultSearchWord.data!);
    return resultSearchWord;
  }

  @override
  Future<ApiResponse> save(WordModel wordModel) async {
    var result = await _searchRepository.saveDetail(wordModel);
    return result;
  }
}
