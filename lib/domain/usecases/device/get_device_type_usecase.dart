import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class GetDeviceTypeUsecase extends UsecaseInterface<String, void> {
  final Repository _deviceRepository;

  GetDeviceTypeUsecase(this._deviceRepository);

  @override
  String execute(void params, String machineType) {
    return _deviceRepository.getMachineType(machineType);
  }
}
