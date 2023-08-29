import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../home/data/models/word_model.dart';
import '../repositories/favorites_repository_interface.dart';
import 'get_favorites_usecase_interface.dart';

class GetFavoritesUsecaseImpl implements GetFavoritesUsecaseInterface {
  static GetIt injector = CoreConfig.injector;
  final _favoritesRepository = injector<FavoritesRepositoryInterface>();

  @override
  Future<ApiResponse<List<WordModel>>> call([int page = 1]) async {
    return _favoritesRepository.getFavorites(page);
  }
}
