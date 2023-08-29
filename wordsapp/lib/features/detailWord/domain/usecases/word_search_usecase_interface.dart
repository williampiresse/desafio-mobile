import '../../../../core/api/api_response.dart';
import '../../../home/data/models/word_model.dart';

abstract class WordSearchUsecaseInterface {
  Future<ApiResponse<WordModel>> call(String word, int wordId);
  Future<ApiResponse> save(WordModel wordModel);
}
