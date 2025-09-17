import 'package:pos_core/domain/dtos/print_params.dart';
import 'package:pos_core/domain/repositories/repository.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

class PrintUsecase extends UsecaseInterface<Future<String>, PrintParams> {
  final Repository _printRepository;

  PrintUsecase(this._printRepository);

  @override
  Future<String> execute(PrintParams params, String machineType) async {
    return await _printRepository.printFile(params.path, params.context);
  }
}
