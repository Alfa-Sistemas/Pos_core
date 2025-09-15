import 'package:pos_core/data/datasource/datasource.dart';
import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/domain/enums/payment_methods.dart';
import 'package:pos_core/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final Datasource _datasource;

  RepositoryImpl(this._datasource);
  @override
  Future<List<Log>> getLastLogsTransaction() async {
    return await _datasource.getLastLogsTransaction();
  }

  @override
  Future<PagamentoEntity> makePayment(
    String formaDePagamento,
    int parcels,
    int ammount, {
    String? deepLinkReturnSchema,
    bool? printAutomaticaly,
    InterestCharging? interestCharging,
  }) async {
    return await _datasource.makePayment(
      formaDePagamento,
      parcels,
      ammount,
      deepLinkReturnSchema: deepLinkReturnSchema,
      printAutomaticaly: printAutomaticaly,
      interestCharging: interestCharging,
    );
  }

  @override
  Stream<String> get paymentComplete => _datasource.paymentComplete;

  @override
  Future<String> printFile(String filePath) async {
    return await _datasource.printFile(filePath);
  }

  @override
  Future<bool> refundSale({
    int? valor,
    bool? permiteEditarValor,
    String? transactionCode,
    String? transactionId,
  }) async {
    return await _datasource.refundSale(
      valor: valor,
      permiteEditarValor: permiteEditarValor,
      transactionCode: transactionCode,
      transactionId: transactionId,
    );
  }

  @override
  Future<String> saveLog(Log log) async {
    return await _datasource.saveLog(log);
  }

  @override
  Future<String> serialDaMaquina() async {
    return await _datasource.serialDaMaquina();
  }

  @override
  String get tipoDaMaquina => _datasource.tipoDaMaquina;

  @override
  Future<void> enableScreenWakeLock() async {
    return await _datasource.enableScreenWakeLock();
  }
}
