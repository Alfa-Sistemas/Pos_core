part of 'refund_bloc.dart';

abstract class RefundState {}

class EstornoNaoInicilizado extends RefundState {}

class EstornoEmProgresso extends RefundState {}

class EstornoSucesso extends RefundState {
  final Map<String, dynamic> resultado;

  EstornoSucesso(this.resultado);
}

class EstornoFalha extends RefundState {}
