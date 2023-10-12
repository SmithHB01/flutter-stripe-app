

class TarjetaCredito {
  final String cardNumberHidden;
  final String cardNumber;
  final String cardHolderName;
  final String brand;
  final String cvv;
  final String expiracyDate;

  TarjetaCredito({
    required this.cardNumberHidden,
    required this.cardNumber,
    required this.cardHolderName,
    required this.brand,
    required this.cvv,
    required this.expiracyDate,
  });
}