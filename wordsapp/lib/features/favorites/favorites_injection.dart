
import 'package:get_it/get_it.dart';

import 'data/datasources/favorites_datasource_interface.dart';
import 'data/datasources/favorites_datasource_impl.dart';
import 'data/repositories/favorites_repository_impl.dart';
import 'domain/repositories/favorites_repository_interface.dart';
import 'domain/usecases/get_favorites_usecase_impl.dart';
import 'domain/usecases/get_favorites_usecase_interface.dart';
import 'domain/usecases/save_favorites_usecase_impl.dart';
import 'domain/usecases/save_favorites_usecase_interface.dart';
import 'presentation/cubit/favorites_cubit.dart';

class FavoritesInjection {
  final GetIt injector;
  FavoritesInjection(
    this.injector,
  );

  static FavoritesInjection? _defaultInstance;

  static FavoritesInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = FavoritesInjection(getIt);
  }

  Future<void> build() async {
    injector.registerFactory<FavoritesDatasourceInterface>(
      () => FavoritesDatasourceImpl(),
    );

    injector.registerFactory<FavoritesRepositoryInterface>(
      () => FavoritesRepositoryImpl(),
    );

    injector.registerFactory<GetFavoritesUsecaseInterface>(
      () => GetFavoritesUsecaseImpl(),
    );

    injector.registerFactory<SaveFavoritesUsecaseInterface>(
      () => SaveFavoritesUsecaseImpl(),
    );

    injector.registerFactory<FavoritesCubit>(
      () => FavoritesCubit(),
    );
  }
}
