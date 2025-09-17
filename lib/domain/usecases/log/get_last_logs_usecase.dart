import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/entities/no_params_entity.dart';
import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class GetLastLogsUsecase extends UsecaseInterface<Future<List<LogEntity>>, NoParamsEntity> {
  final Repository _logRepository;

  GetLastLogsUsecase(this._logRepository);
  @override
  Future<List<LogEntity>> execute(NoParamsEntity params, String machineType) async {
    return await _logRepository.getLastLogsTransaction();
  }
}
