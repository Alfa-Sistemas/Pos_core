part of 'refund_bloc.dart';

abstract class RefundEvent {}

class EstornoIniciou extends RefundEvent {
  final int valor;

  final String atk;

  final bool permiteEditarValor;

  EstornoIniciou(this.valor, this.atk, this.permiteEditarValor);
}

class EstornoFinalizou extends RefundEvent {
  final String result;

  EstornoFinalizou(this.result);
}
