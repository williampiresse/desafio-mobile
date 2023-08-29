import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../../core/error/exception_custom.dart';
import '../../../home/data/models/word_model.dart';
import '../../domain/repositories/historic_repository_interface.dart';
import '../datasources/historic_datasource_interface.dart';

class HistoricRepositoryImpl implements HistoricRepositoryInterface {
  static GetIt injector = CoreConfig.injector;
  final _historicDatasource = injector<HistoricDatasourceInterface>();

  @override
  Future<ApiResponse<List<WordModel>>> getHistoric([int page = 1]) async {
    try {
      return _historicDatasource.getHistoric(page);
    } on ExceptionCustom catch (err) {
      return ApiResponse(isError: true, message: err.message);
    }
  }

  @override
  Future<ApiResponse> save(WordModel word) async {
    try {
      await _historicDatasource.save(word);
      return ApiResponse(isError: false, statusCode: 202);
    } on ExceptionCustom catch (err) {
      return ApiResponse(isError: true, message: err.message);
    }
  }
}
