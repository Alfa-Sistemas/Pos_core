import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/domain/enums/payment_methods.dart';

abstract class Repository {
  // Device
  Future<String> serialDaMaquina();
  String get tipoDaMaquina;
  // Logs
  Future<List<Log>> getLastLogsTransaction();
  Future<String> saveLog(Log log);
  // Payment
  Future<PagamentoEntity> makePayment(
    PaymentMethods formaDePagamento,
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
  // Scanner
}
