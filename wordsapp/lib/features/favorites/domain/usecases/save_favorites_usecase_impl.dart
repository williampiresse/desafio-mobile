import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../home/data/models/word_model.dart';
import '../repositories/favorites_repository_interface.dart';
import 'save_favorites_usecase_interface.dart';

class SaveFavoritesUsecaseImpl implements SaveFavoritesUsecaseInterface {
  static GetIt injector = CoreConfig.injector;
  final _favoritesRepository = injector<FavoritesRepositoryInterface>();

  @override
  Future<ApiResponse> call(WordModel word) async {
    var result = await _favoritesRepository.save(word);

    return result;
  }
}
