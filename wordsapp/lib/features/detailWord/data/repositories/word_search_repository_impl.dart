import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../../core/error/exception_custom.dart';
import '../../../home/data/models/word_model.dart';
import '../../domain/repositories/word_search_repository_interface.dart';
import '../datasources/word_ search_datasource_interface.dart';

class WordSearchRepositoryImpl implements WordSearchRepositoryInterface {
  static GetIt injector = CoreConfig.injector;
  final _wordSearchDatasource = injector<WordSearchDatasourceInterface>();

  @override
  Future<ApiResponse<WordModel>> search(String word) async {
    try {
      return _wordSearchDatasource.search(word);
    } on ExceptionCustom catch (err) {
      return ApiResponse(isError: true, message: err.message);
    }
  }

  @override
  Future<ApiResponse> saveDetail(WordModel wordModel) async {
    try {
      return _wordSearchDatasource.save(wordModel);
    } on ExceptionCustom catch (err) {
      return ApiResponse(isError: true, message: err.message);
    }
  }
}
