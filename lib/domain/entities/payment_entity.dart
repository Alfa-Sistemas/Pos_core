class PagamentoEntity {
  final String cardBrand;
  final String cardBin;
  final String nsu;
  final String date;
  final String time;
  final String hostNSU;
  final String transactionID;
  final String transactionCode;
  final String? erro;

  PagamentoEntity({
    required this.cardBrand,
    required this.cardBin,
    required this.nsu,
    required this.date,
    required this.time,
    required this.hostNSU,
    required this.transactionID,
    required this.transactionCode,
  }) : erro = null;
  
  PagamentoEntity.erro({required this.erro})
      : cardBin = 'erro',
        cardBrand = 'erro',
        nsu = 'erro ',
        date = '',
        time = '',
        hostNSU = 'erro',
        transactionCode = 'erro',
        transactionID = 'erro';
}