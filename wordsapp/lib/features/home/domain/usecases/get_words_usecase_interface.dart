import '../../../../core/api/api_response.dart';
import '../../data/models/word_model.dart';

abstract class GetWordsUsecaseInterface {
  Future<ApiResponse<List<WordModel>>> call([int page = 1]);
}
