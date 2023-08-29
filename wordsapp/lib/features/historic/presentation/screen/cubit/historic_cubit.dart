import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/core_config.dart';
import '../../../../home/data/models/word_model.dart';
import '../../../domain/usecases/get_historic_usecase.dart';
import '../../../domain/usecases/salve_historic_usecase_interface.dart';
import 'historic_state.dart';

class HistoricCubit extends Cubit<HistoricState> {
  HistoricCubit() : super(HistoricInitState());
  static GetIt injector = CoreConfig.injector;

  final _getHistoricUsecaseInterface = injector<GetHistoricUsecaseInterface>();
  final _saveHistoricUsecaseInterface =
      injector<SaveHistoricUsecaseInterface>();

  Future<void> call([int page = 1]) async {
    final result = await _getHistoricUsecaseInterface.call(page);
    final data = result.data ?? [];
    if (result.isSuccess) {
      return emit(HistoricSuccess(data, result.message, page, data.isEmpty));
    } else if (result.dataIsEmpty) {
      return emit(HistoricSuccess(data, result.message, page, true));
    }
    return emit(HistoricFailed(result.message));
  }

  Future<void> save(WordModel word) async {
    await _saveHistoricUsecaseInterface.call(word);
  }
}
