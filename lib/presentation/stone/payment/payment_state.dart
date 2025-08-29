abstract class PaymentState {}

class PagamentoNaoIniciado extends PaymentState {}

class PagamentoEmProgresso extends PaymentState {}

class PagamentoSucesso extends PaymentState {
  final Map<String, dynamic> resultado;

  PagamentoSucesso({required this.resultado});
}

class PagamentoFalha extends PaymentState {}
