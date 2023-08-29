
import 'package:get_it/get_it.dart';

import 'data/datasources/historic_datasource_impl.dart';
import 'data/datasources/historic_datasource_interface.dart';
import 'data/repositories/historic_repository_impl.dart';
import 'domain/repositories/historic_repository_interface.dart';
import 'domain/usecases/get_historic_usecase.dart';
import 'domain/usecases/get_historic_usecase_impl.dart';
import 'domain/usecases/salve_historic_usecase_interface.dart';
import 'domain/usecases/save_historic_usecase_impl.dart';
import 'presentation/screen/cubit/historic_cubit.dart';

class HistoricInjection {
  HistoricInjection(this.injector);
  final GetIt injector;

  static HistoricInjection? _defaultInstance;

  static HistoricInjection getInstance(GetIt getIt) {
    if (_defaultInstance != null) {
      return _defaultInstance!;
    }
    return _defaultInstance = HistoricInjection(getIt);
  }

  Future<void> build() async {
    injector.registerFactory<HistoricDatasourceInterface>(
      () => HistoricDatasourceImpl(),
    );

    injector.registerFactory<HistoricRepositoryInterface>(
      () => HistoricRepositoryImpl(),
    );

    injector.registerFactory<GetHistoricUsecaseInterface>(
      () => GetHistoricUsecaseImpl(),
    );

    injector.registerFactory<SaveHistoricUsecaseInterface>(
      () => SaveHistoricUsecaseImpl(),
    );

    injector.registerFactory<HistoricCubit>(
      () => HistoricCubit(),
    );
  }
}
