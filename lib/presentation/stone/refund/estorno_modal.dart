import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pos_core/presentation/stone/refund/refund_bloc.dart';

Future<Map<String, dynamic>?> showEstornoModal(
  BuildContext context, {
  required int valor,
  required String atk,
  required bool permiteEditarValor,
  required String deepLinkReturnSchema,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    useSafeArea: true,
    builder: (_) {
      return EstornoModal(
        valor: valor,
        atk: atk,
        permiteEditarValor: permiteEditarValor,
        deepLinkReturnSchema: deepLinkReturnSchema,
      );
    },
  );
}

class EstornoModal extends StatelessWidget {
  final int valor;
  final String atk;
  final bool permiteEditarValor;
  final String deepLinkReturnSchema;

  EstornoModal({
    required this.atk,
    required this.valor,
    required this.permiteEditarValor,
    required this.deepLinkReturnSchema,
    super.key,
  });

  final refundBloc = GetIt.I.get<RefundBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          refundBloc..add(EstornoIniciou(valor, atk, permiteEditarValor)),
      child: BlocListener<RefundBloc, RefundState>(
        listener: (context, state) {
          if (state is EstornoSucesso) {
            Navigator.of(context).pop(state.resultado);
          }
          if (state is EstornoFalha) {
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
