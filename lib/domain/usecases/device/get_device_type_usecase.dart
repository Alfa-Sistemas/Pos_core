import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class GetDeviceTypeUsecase extends UsecaseInterface<Future<String>, void> {
  final Repository _deviceRepository;

  GetDeviceTypeUsecase(this._deviceRepository);

  @override
  Future<String> execute(void params, String machineType) async {
    return _deviceRepository.tipoDaMaquina;
  }
}
