import '../../../../core/api/api_response.dart';
import '../../../home/data/models/word_model.dart';

abstract class WordSearchDatasourceInterface {
  Future<ApiResponse<WordModel>> search(String word);
  Future<ApiResponse<bool>> save(WordModel wordModel);
}
