import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';

abstract class Repository {
  // Device
  Future<String> serialDaMaquina();
  String get tipoDaMaquina;
  // Logs
  Future<List<LogEntity>> getLastLogsTransaction();
  Future<String> saveLog(LogEntity log);
  // Payment
  Future<PagamentoEntity> makePayment(
    String formaDePagamento,
    int parcels,
    int ammount, {
    String? deepLinkReturnSchema,
    bool? printAutomaticaly,
    InterestCharging? interestCharging,
  });
  Stream<String> get paymentComplete;
  // Print
  Future<String> printFile(String filePath);
  // Refund
  Future<bool> refundSale({
    int? valor,
    bool? permiteEditarValor,
    String? transactionCode,
    String? transactionId,
  });
  // Screen
  Future<void> enableScreenWakeLock();
  // Scanner
}
