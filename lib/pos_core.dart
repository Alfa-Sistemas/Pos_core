import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pos_core/core/dependency_injection.dart';
import 'package:pos_core/domain/dtos/payment_params.dart';
import 'package:pos_core/domain/dtos/refund_params.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/domain/usecases/usecase_interface.dart';

var printUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "print");
var refundUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "refund");
var getSerialUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "serial");
var makePaymentUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "payment");
var screenWakeUsecase = GetIt.I.get<UsecaseInterface>(instanceName: "screen");
var paymentCompleteUsecase = GetIt.I.get<UsecaseInterface>(
  instanceName: "paymentComplete",
);

class PosCore {
  Future<void> inject() => initInjectors();
  
  Future<String> imprimirArquivo(BuildContext context, String filePath) async {
    return await printUsecase.execute(filePath);
  }

  Future<PagamentoEntity> fazerPagamento(
    String formaDePagamento,
    int parcels,
    int ammount, {
    String? deepLinkReturnSchema,
    bool? printAutomaticaly,
    InterestCharging? interestCharging,
  }) async {
    return await makePaymentUsecase.execute(
      PaymentParams(
        formaDePagamento,
        parcels,
        ammount,
        deepLinkReturnSchema,
        printAutomaticaly,
        interestCharging,
      ),
    );
  }

  Future<bool> fazerEstorno({
    int? valor,
    bool? permiteEditarValor,
    String? transactionCode,
    String? transactionId,
  }) async {
    return await refundUsecase.execute(
      RefundParams(valor, permiteEditarValor, transactionCode, transactionId),
    );
  }

  Future<String> serialDaMaquina() async {
    return await getSerialUsecase.execute(null);
  }
}
