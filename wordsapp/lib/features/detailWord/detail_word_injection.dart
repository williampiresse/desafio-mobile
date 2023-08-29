import 'package:get_it/get_it.dart';

import 'data/datasources/word_ search_datasource_interface.dart';
import 'data/datasources/word_search_datasource_impl.dart';
import 'data/repositories/word_search_repository_impl.dart';
import 'domain/repositories/word_search_repository_interface.dart';
import 'domain/usecases/word_search_usecase_impl.dart';
import 'domain/usecases/word_search_usecase_interface.dart';
import 'presentation/cubit/detail_cubit.dart';

class DetailWordjection {
  DetailWordjection(this.injector);

  final GetIt injector;
  static DetailWordjection? _defaultInstance;

  static DetailWordjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = DetailWordjection(getIt);
  }

  Future<void> build() async {
    injector.registerFactory<WordSearchDatasourceInterface>(
      () => WordSearchDatasourceImpl(),
    );

    injector.registerFactory<WordSearchRepositoryInterface>(
      () => WordSearchRepositoryImpl(),
    );

    injector.registerFactory<WordSearchUsecaseInterface>(
      () => WordSearchUsecaseImpl(),
    );

    injector.registerFactory<DetailCubit>(
      () => DetailCubit(),
    );
  }
}
