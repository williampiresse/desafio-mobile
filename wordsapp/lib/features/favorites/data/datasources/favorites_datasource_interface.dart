import '../../../../core/api/api_response.dart';
import '../../../home/data/models/word_model.dart';

abstract class FavoritesDatasourceInterface {
  Future<bool> save(WordModel word);
  Future<ApiResponse<List<WordModel>>> getFavorites([int page = 1]);
}
