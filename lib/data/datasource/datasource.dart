import 'package:flutter/widgets.dart';
import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/domain/enums/payment_methods.dart';

abstract class Datasource {
  // Device
  Future<String> serialDaMaquina();
  String getMachineType(String machineType);
  // Logs
  Future<List<LogEntity>> getLastLogsTransaction();
  Future<String> saveLog(LogEntity log);
  // Payment
  Future<PagamentoEntity> makePayment(
    PaymentMethods formaDePagamento,
    int parcels,
    int ammount,
    BuildContext context, {
    String? deepLinkReturnSchema,
    bool? printAutomaticaly,
    InterestCharging? interestCharging,
  });
  Stream<String> get paymentComplete;
  // Print
  Future<String> printFile(String filePath, BuildContext context);
  // Refund
  Future<bool> refundSale({
    required BuildContext context,
    int? valor,
    int? atk,
    bool? permiteEditarValor,
    String? transactionCode,
    String? transactionId,
  });
  // Screen
  Future<void> enableScreenWakeLock();
  // Scanner
}
