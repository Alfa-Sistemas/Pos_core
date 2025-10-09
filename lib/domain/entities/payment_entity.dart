class PagamentoEntity {
  final String cardBrand;
  final String cardBin;
  final String nsu;
  final String date;
  final String time;
  final String hostNSU;
  final String transactionID;
  final String transactionCode;
  final String tipoMaquina;
  final String atk;
  final String? erro;

  PagamentoEntity({
    required this.cardBrand,
    required this.tipoMaquina,
    required this.cardBin,
    required this.nsu,
    required this.date,
    required this.time,
    required this.hostNSU,
    required this.transactionID,
    required this.transactionCode,
    required this.atk,
  }) : erro = null;
  
  PagamentoEntity.erro({required this.erro})
      : cardBin = 'erro',
        cardBrand = 'erro',
        nsu = 'erro ',
        date = '',
        time = '',
        tipoMaquina = "",
        hostNSU = 'erro',
        transactionCode = 'erro',
        atk = '',
        transactionID = 'erro';
}