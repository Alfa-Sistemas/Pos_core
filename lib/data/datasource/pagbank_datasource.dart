import 'package:pos_core/data/datasource/datasource.dart';
import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/domain/enums/payment_methods.dart';

class PagbankDatasource implements Datasource {
  @override
  Future<List<Log>> getLastLogsTransaction() {
    // TODO: implement getLastLogsTransaction
    throw UnimplementedError();
  }

  @override
  Future<PagamentoEntity> makePayment(PaymentMethods formaDePagamento, int parcels, int ammount, {String? deepLinkReturnSchema, bool? printAutomaticaly, InterestCharging? interestCharging}) {
    // TODO: implement makePayment
    throw UnimplementedError();
  }

  @override
  // TODO: implement paymentComplete
  Stream<String> get paymentComplete => throw UnimplementedError();

  @override
  Future<String> printFile(String filePath) {
    // TODO: implement printFile
    throw UnimplementedError();
  }

  @override
  Future<bool> refundSale({int? valor, bool? permiteEditarValor, String? transactionCode, String? transactionId}) {
    // TODO: implement refundSale
    throw UnimplementedError();
  }

  @override
  Future<String> saveLog(Log log) {
    // TODO: implement saveLog
    throw UnimplementedError();
  }

  @override
  Future<String> serialDaMaquina() {
    // TODO: implement serialDaMaquina
    throw UnimplementedError();
  }

  @override
  // TODO: implement tipoDaMaquina
  String get tipoDaMaquina => throw UnimplementedError();
  
  @override
  Future<void> enableScreenWakeLock() {
    // TODO: implement enableScreenWakeLock
    throw UnimplementedError();
  }
  
}