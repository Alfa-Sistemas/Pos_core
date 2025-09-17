import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pos_core/core/dependency_injection.dart';
import 'package:pos_core/domain/dtos/payment_params.dart';
import 'package:pos_core/domain/dtos/refund_params.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/domain/enums/payment_methods.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

var printUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "print");
var refundUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "refund");
var getSerialUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "serial");
var getDeviceTypeUsecase = GetIt.I.get<UsecaseInterface>(
  instanceName: "deviceType",
);
var makePaymentUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "payment");
var screenWakeUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "screen");
var paymentCompleteUsecase = GetIt.I.get<UsecaseInterface>(
  instanceName: "paymentComplete",
);
  final getIt = GetIt.instance;

class PosCore {
  final String machineType;

  PosCore(this.machineType);


  Future<void> inject() => initInjectors();

  Future<String> imprimirArquivo(
    String filePath,
    BuildContext context,
    String machineType,
  ) async {
    return await printUsecase.execute(filePath, machineType);
  }

  Future<PagamentoEntity> fazerPagamento(
    PaymentMethods formaDePagamento,
    int parcels,
    int ammount,
    BuildContext context, {
    String? deepLinkReturnSchema,
    bool? printAutomaticaly,
    InterestCharging? interestCharging,
    required String machineType,
  }) async {
    return await makePaymentUsecase.execute(
      PaymentParams(
        formaDePagamento,
        parcels,
        ammount,
        deepLinkReturnSchema,
        printAutomaticaly,
        interestCharging,
        context,
      ),
      machineType,
    );
  }

  Future<bool> fazerEstorno({
    int? valor,
    bool? permiteEditarValor,
    String? transactionCode,
    String? transactionId,
    required String machineType,
  }) async {
    return await refundUsecase.execute(
      RefundParams(valor, permiteEditarValor, transactionCode, transactionId),
      machineType,
    );
  }

  Future<String> serialDaMaquina(String machineType) async {
    return await getSerialUsecase.execute(null, machineType);
  }

  String get machineTypje => getDeviceTypeUsecase.execute(null, machineType);
}
