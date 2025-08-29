class RefundParams {
  final int? valor;
  final bool? permiteEditarValor;
  final String? transactionCode;
  final String? transactionId;

  RefundParams(
    this.valor,
    this.permiteEditarValor,
    this.transactionCode,
    this.transactionId,
  );
}
