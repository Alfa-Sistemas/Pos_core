import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/entities/no_params_entity.dart';
import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class GetLastLogsUsecase extends UsecaseInterface<Future<List<Log>>, NoParamsEntity> {
  final Repository _logRepository;

  GetLastLogsUsecase(this._logRepository);
  @override
  Future<List<Log>> execute(NoParamsEntity params) async {
    return await _logRepository.getLastLogsTransaction();
  }
}
