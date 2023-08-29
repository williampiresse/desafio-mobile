import '../../../../core/api/api_response.dart';
import '../models/word_model.dart';

abstract class WordsRemoteDatasourceInterface {
  Future<ApiResponse<List<WordModel>>> getListWords([int page = 1]);
}
