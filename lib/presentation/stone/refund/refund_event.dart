part of 'refund_bloc.dart';

abstract class RefundEvent {}

class EstornoIniciou extends RefundEvent {
  final int valor;

  final String atk;

  final bool permiteEditarValor;

  final String transactionId;

  final String machineType;

  EstornoIniciou(this.valor, this.atk, this.permiteEditarValor, this.transactionId, this.machineType);
}

class EstornoFinalizou extends RefundEvent {
  final String result;

  EstornoFinalizou(this.result);
}
