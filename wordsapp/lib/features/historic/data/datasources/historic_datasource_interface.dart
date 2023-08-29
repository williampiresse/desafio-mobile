import '../../../../core/api/api_response.dart';
import '../../../home/data/models/word_model.dart';

abstract class HistoricDatasourceInterface {
  Future<bool> save(WordModel word);
  Future<ApiResponse<List<WordModel>>> getHistoric([int page = 1]);
}
