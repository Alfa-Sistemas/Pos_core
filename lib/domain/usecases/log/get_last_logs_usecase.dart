import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/entities/no_params_entity.dart';
import 'package:pos_core/domain/repositories/log_repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class GetLastLogsUsecase extends UsecaseInterface<List<Log>, NoParamsEntity> {
  final LogRepository _logRepository;

  GetLastLogsUsecase(this._logRepository);
  @override
  Future<List<Log>> execute(NoParamsEntity params) async {
    return await _logRepository.getLastLogsTransaction();
  }
}
