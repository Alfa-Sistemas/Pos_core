// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class RefundParams {
  final BuildContext context;
  final int? valor;
  final bool? permiteEditarValor;
  final String? transactionCode;
  final String? transactionId;
  final String? atk;

  RefundParams(
    this.context,
    this.valor,
    this.permiteEditarValor,
    this.transactionCode,
    this.transactionId,
    this.atk,
  );
}
