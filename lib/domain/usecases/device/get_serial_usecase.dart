import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class GetSerialUsecase extends UsecaseInterface<Future<String>, void> {
  final Repository _deviceRepository;

  GetSerialUsecase(this._deviceRepository);

  @override
  Future<String> execute(void params) async {
    return await _deviceRepository.serialDaMaquina();
  }
}
