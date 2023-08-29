import '../../../../core/api/api_response.dart';
import '../../../home/data/models/word_model.dart';

abstract class WordSearchRepositoryInterface {
  Future<ApiResponse<WordModel>> search(String word);
  Future<ApiResponse> saveDetail(WordModel wordModel);
}
