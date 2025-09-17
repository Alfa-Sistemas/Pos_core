import 'package:flutter/cupertino.dart';
import 'package:pos_core/data/datasource/datasource.dart';
import 'package:pos_core/domain/entities/log_entity.dart';
import 'package:pos_core/domain/entities/payment_entity.dart';
import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final Datasource _datasource;

  RepositoryImpl(this._datasource);
  @override
  Future<List<LogEntity>> getLastLogsTransaction() async {
    return await _datasource.getLastLogsTransaction();
  }

  @override
  Future<PagamentoEntity> makePayment(
    String formaDePagamento,
    int parcels,
    int ammount,
    BuildContext context, {
    String? deepLinkReturnSchema,
    bool? printAutomaticaly,
    InterestCharging? interestCharging,
  }) async {
    return await _datasource.makePayment(
      formaDePagamento,
      parcels,
      ammount,
      context,
      deepLinkReturnSchema: deepLinkReturnSchema,
      printAutomaticaly: printAutomaticaly,
      interestCharging: interestCharging,
    );
  }

  @override
  Stream<String> get paymentComplete => _datasource.paymentComplete;

  @override
  Future<String> printFile(String filePath, BuildContext context) async {
    return await _datasource.printFile(filePath, context);
  }

  @override
  Future<bool> refundSale({
    int? valor,
    int? atk,
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
  Future<String> saveLog(LogEntity log) async {
    return await _datasource.saveLog(log);
  }

  @override
  Future<String> serialDaMaquina() async {
    return await _datasource.serialDaMaquina();
  }

  @override
  Future<void> enableScreenWakeLock() async {
    return await _datasource.enableScreenWakeLock();
  }

  @override
  String getMachineType(String machineType) {
    return _datasource.getMachineType(machineType);
  }
}
