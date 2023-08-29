import 'package:get_it/get_it.dart';

import 'data/datasources/words_remote_datasource_impl.dart';
import 'data/datasources/words_remote_datasource_interface.dart';
import 'data/repositories/words_repository_impl.dart';
import 'domain/repositories/words_repository_interface.dart';
import 'domain/usecases/get_words_usecase_interface.dart';
import 'domain/usecases/get_words_usecase_impl.dart';
import 'presentation/screen/cubit/home_cubi.dart';

class HomeInjection {
  HomeInjection(this.injector);

  final GetIt injector;
  static HomeInjection? _defaultInstance;

  static HomeInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = HomeInjection(getIt);
  }

  Future<void> build() async {
    injector.registerFactory<WordsRemoteDatasourceInterface>(
      () => WordsRemoteDatasourceImpl(),
    );

    injector.registerFactory<WordsRepositoryInterface>(
      () => WordsRepositoryImpl(),
    );

    injector.registerFactory<GetWordsUsecaseInterface>(
      () => GetWordsUsecaseImpl(),
    );

    injector.registerFactory<HomeCubit>(
      () => HomeCubit(),
    );
  }
}
