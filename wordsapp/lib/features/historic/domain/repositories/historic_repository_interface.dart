import '../../../../core/api/api_response.dart';
import '../../../home/data/models/word_model.dart';

abstract class HistoricRepositoryInterface {
  Future<ApiResponse> save(WordModel word);
  Future<ApiResponse<List<WordModel>>> getHistoric([int page = 1]);
}
