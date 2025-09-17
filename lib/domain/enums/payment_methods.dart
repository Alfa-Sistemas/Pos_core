enum PaymentMethods {
  debito(1),
  credito(2),
  vale(3),
  pix(4);

  final int codigo;
  const PaymentMethods(this.codigo);
}