import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/core_config.dart';
import '../../../home/data/models/word_model.dart';
import '../../domain/usecases/get_favorites_usecase_interface.dart';
import '../../domain/usecases/save_favorites_usecase_interface.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitState());
  static GetIt injector = CoreConfig.injector;

  final _getFavoritesUsecaseInterface =
      injector<GetFavoritesUsecaseInterface>();
  final _saveFavoritesUsecaseInterface =
      injector<SaveFavoritesUsecaseInterface>();

  Future<void> call([int page = 1]) async {
    final result = await _getFavoritesUsecaseInterface.call();
    final data = result.data ?? [];

    if (result.isSuccess) {
      return emit(FavoritesSuccess(data, result.message, page, data.isEmpty));
    } else if (result.dataIsEmpty) {
      return emit(FavoritesSuccess(data, result.message, page, true));
    }
    return emit(FavoritesFailed(result.message));
  }

  Future<void> save(WordModel word) async {
    var result = await _saveFavoritesUsecaseInterface.call(word);

    emit(FavoritesLoading());

    if (result.statusCode == 202) {
      emit(FavoritesSuccess(result.data!, result.message, 0, true));
      return;
    }

    emit(FavoritesFailed(result.message));
  }
}
