
import '../../../../core/api/api_response.dart';
import '../../data/models/word_model.dart';

abstract class WordsRepositoryInterface {
  Future<ApiResponse<List<WordModel>>> get([int page = 1]);
}
