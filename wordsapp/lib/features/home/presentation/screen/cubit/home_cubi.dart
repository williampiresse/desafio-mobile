import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/core_config.dart';
import '../../../domain/usecases/get_words_usecase_interface.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  static GetIt injector = CoreConfig.injector;

  final _getWordsUserUsecaseInterface = injector<GetWordsUsecaseInterface>();

  Future<bool> call([int page = 1]) async {
    final result = await _getWordsUserUsecaseInterface.call(page);
    final data = result.data ?? [];

    if (result.isSuccess) {
      emit(HomeSuccess(data, result.message, page, false));
      return true;
    }  else if (result.dataIsEmpty) {
      emit(HomeSuccess(data, result.message, page, true));
      return true;
    }
    emit(HomeFailed(result.message));
    return false;
  }
}
