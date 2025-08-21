enum PaymentMethods {
  credito(2),
  debito(1),
  vale(3),
  pix(4);

  final int codigo;
  const PaymentMethods(this.codigo);
}