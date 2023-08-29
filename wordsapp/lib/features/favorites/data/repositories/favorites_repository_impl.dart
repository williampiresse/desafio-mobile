import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../../core/error/exception_custom.dart';
import '../../../home/data/models/word_model.dart';
import '../../domain/repositories/favorites_repository_interface.dart';
import '../datasources/favorites_datasource_interface.dart';

class FavoritesRepositoryImpl implements FavoritesRepositoryInterface {
  static GetIt injector = CoreConfig.injector;
  final _favoritesDatasource = injector<FavoritesDatasourceInterface>();

  @override
  Future<ApiResponse<List<WordModel>>> getFavorites([int page = 1]) async {
    try {
      return _favoritesDatasource.getFavorites(page);
    } on ExceptionCustom catch (err) {
      return ApiResponse(isError: true, message: err.message);
    }
  }

  @override
  Future<ApiResponse> save(WordModel word) async {
    try {
      await _favoritesDatasource.save(word);
      return ApiResponse(isError: false, statusCode: 202);
    } on ExceptionCustom catch (err) {
      return ApiResponse(isError: true, message: err.message);
    }
  }
}
