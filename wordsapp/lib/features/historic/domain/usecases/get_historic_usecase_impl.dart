import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../home/data/models/word_model.dart';
import '../repositories/historic_repository_interface.dart';
import 'get_historic_usecase.dart';

class GetHistoricUsecaseImpl implements GetHistoricUsecaseInterface {
  static GetIt injector = CoreConfig.injector;
  final _historicRepository = injector<HistoricRepositoryInterface>();

  @override
  Future<ApiResponse<List<WordModel>>> call([int page = 1]) async {
    return _historicRepository.getHistoric(page);
  }
}
