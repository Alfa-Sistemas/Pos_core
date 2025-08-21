import 'package:flutter/widgets.dart';

abstract class RefundRepository {
  Future<bool> refundSale({
    required BuildContext context,
    int? valor,
    bool? permiteEditarValor,
    String? transactionCode,
    String? transactionId,
  });
}