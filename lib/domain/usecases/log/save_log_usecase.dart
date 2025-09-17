import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class SaveLogUsecase extends UsecaseInterface<Future<String>, LogEntity> {
  final Repository _logRepository;

  SaveLogUsecase(this._logRepository);

  @override
  Future<String> execute(LogEntity params, String machineType) async {
    return await _logRepository.saveLog(params);
  }
}
