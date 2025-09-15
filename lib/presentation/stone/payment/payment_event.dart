import 'package:pos_core/domain/enums/interest_charging.dart';

abstract class PaymentEvent {}

class PagamentoIniciou extends PaymentEvent {
  final String formaDePagamento;
  final int valor;
  final int parcelas;
  final String deepLinkReturnSchema;
  final bool printAutomaticaly;
  final InterestCharging formaDeCobrancaDeJuros;

  PagamentoIniciou({
    required this.formaDePagamento,
    required this.valor,
    required this.parcelas,
    required this.printAutomaticaly,
    required this.deepLinkReturnSchema,
    required this.formaDeCobrancaDeJuros,
  });
}

class PagamentoFinalizou extends PaymentEvent {
  final String result;

  PagamentoFinalizou({required this.result});
}
