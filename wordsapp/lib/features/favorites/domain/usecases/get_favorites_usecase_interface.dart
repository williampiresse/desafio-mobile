import '../../../../core/api/api_response.dart';
import '../../../home/data/models/word_model.dart';

abstract class GetFavoritesUsecaseInterface {
  Future<ApiResponse<List<WordModel>>> call([int page = 1]);
}
