import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class ScreenWakeUsecase extends UsecaseInterface<Future<void>, void> {
  final Repository _repository;

  ScreenWakeUsecase(this._repository);

  @override
  Future<void> execute(void params, String machineType) {
    return _repository.enableScreenWakeLock();
  }
}
