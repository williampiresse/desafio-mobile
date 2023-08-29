import '../../../../core/api/api_response.dart';
import '../../../home/data/models/word_model.dart';

abstract class FavoritesRepositoryInterface {
  Future<ApiResponse<List<WordModel>>> getFavorites([int page = 1]);
  Future<ApiResponse> save(WordModel word);
}
