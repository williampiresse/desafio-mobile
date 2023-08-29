import '../../../../core/api/api_response.dart';
import '../../../home/data/models/word_model.dart';

abstract class SaveFavoritesUsecaseInterface {
  Future<ApiResponse> call(WordModel word);
}
