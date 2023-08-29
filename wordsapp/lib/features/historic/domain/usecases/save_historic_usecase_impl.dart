import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../home/data/models/word_model.dart';
import '../repositories/historic_repository_interface.dart';
import 'salve_historic_usecase_interface.dart';

class SaveHistoricUsecaseImpl implements SaveHistoricUsecaseInterface {
  static GetIt injector = CoreConfig.injector;
  final _historicRepository = injector<HistoricRepositoryInterface>();

  @override
  Future<ApiResponse> call(WordModel word) async {
    return _historicRepository.save(word);
  }
}
