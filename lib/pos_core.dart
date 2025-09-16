import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

var printUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "print");

class PosCore {
  Future<String> imprimirArquivo(BuildContext context, String filePath) async {
    return await printUsecase.execute(filePath);
  }
}
