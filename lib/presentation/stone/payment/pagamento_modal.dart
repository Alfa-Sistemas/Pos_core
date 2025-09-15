// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:pos_core/domain/enums/interest_charging.dart';
import 'package:pos_core/presentation/stone/payment/payment_bloc.dart';
import 'package:pos_core/presentation/stone/payment/payment_event.dart';
import 'package:pos_core/presentation/stone/payment/payment_state.dart';

Future<Map<String, dynamic>?> showPagamentoModal(
  BuildContext context, {
  required String formaDePagamento,
  required int valor,
  required int parcelas,
  required String deepLinkReturnSchema,
  required bool printAutomaticaly,
  required InterestCharging formaDeCobranca,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    useSafeArea: true,
    builder: (_) {
      return PagamentoModal(
        formaDePagamento: formaDePagamento,
        valor: valor,
        parcelas: parcelas,
        printAutomaticaly: printAutomaticaly,
        deepLinkReturnSchema: deepLinkReturnSchema,
        formaDeCobrancaDeJuros: formaDeCobranca,
      );
    },
  );
}

class PagamentoModal extends StatelessWidget {
  final String formaDePagamento;
  final int valor;
  final int parcelas;
  final String deepLinkReturnSchema;
  final InterestCharging formaDeCobrancaDeJuros;
  final bool printAutomaticaly;

  PagamentoModal({
    super.key,
    required this.formaDePagamento,
    required this.valor,
    required this.parcelas,
    required this.deepLinkReturnSchema,
    required this.formaDeCobrancaDeJuros,
    required this.printAutomaticaly,
  });

  final paymentBloc = GetIt.I.get<PaymentBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          paymentBloc..add(
            PagamentoIniciou(
              formaDePagamento: formaDePagamento,
              valor: valor,
              parcelas: parcelas,
              deepLinkReturnSchema: deepLinkReturnSchema,
              printAutomaticaly: printAutomaticaly,
              formaDeCobrancaDeJuros: formaDeCobrancaDeJuros,
            ),
          ),
      child: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state is PagamentoSucesso) {
            Navigator.of(context).pop(state.resultado);
          }
          if (state is PagamentoFalha) {
            Navigator.of(context).pop(null);
          }
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [CloseButton()],
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar operação'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
