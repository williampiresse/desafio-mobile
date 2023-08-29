import 'package:get_it/get_it.dart';

import '../../../../core/api/api_response.dart';
import '../../../../core/core_config.dart';
import '../../../../core/enums/status_code.dart';
import '../../../../core/error/exception_custom.dart';
import '../../domain/repositories/words_repository_interface.dart';
import '../datasources/words_remote_datasource_interface.dart';
import '../models/word_model.dart';

class WordsRepositoryImpl implements WordsRepositoryInterface {
  static GetIt injector = CoreConfig.injector;
  final _wordRemoteDatasource = injector<WordsRemoteDatasourceInterface>();

  @override
  Future<ApiResponse<List<WordModel>>> get([int page = 1]) async {
    try {
      return _wordRemoteDatasource.getListWords(page);
    } on ExceptionCustom catch (err) {
      return ApiResponse(
        isError: true,
        message: err.message,
        statusCode: err.statusCode,
        statusCodeEnum: StatusCodeEnum.getById(err.statusCode!),
      );
    }
  }
}
