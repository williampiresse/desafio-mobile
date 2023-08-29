import 'package:get_it/get_it.dart';


import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../data/models/word_model.dart';
import '../repositories/words_repository_interface.dart';
import 'get_words_usecase_interface.dart';

class GetWordsUsecaseImpl implements GetWordsUsecaseInterface {
  static GetIt injector = CoreConfig.injector;
  final _wordsRepository = injector<WordsRepositoryInterface>();

  @override
  Future<ApiResponse<List<WordModel>>> call([int page = 1]) async {
    return _wordsRepository.get(page);
  }
}
