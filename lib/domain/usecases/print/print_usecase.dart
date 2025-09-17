import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class PrintUsecase extends UsecaseInterface<Future<String>, String> {
  final Repository _printRepository;

  PrintUsecase(this._printRepository);

  @override
  Future<String> execute(String params, String machineType) async {
    return _printRepository.printFile(params);
  }
}
