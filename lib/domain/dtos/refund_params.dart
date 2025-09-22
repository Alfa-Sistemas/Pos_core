import 'package:flutter/widgets.dart';

class RefundParams {
  final BuildContext context;
  final int? valor;
  final bool? permiteEditarValor;
  final String? transactionCode;
  final String? transactionId;

  RefundParams(
    this.context,
    this.valor,
    this.permiteEditarValor,
    this.transactionCode,
    this.transactionId,
  );
}
