import 'package:crypto_coin/repositories/crypto_coins/models/models.dart';

class CryptoCoinDetail extends CryptoCoin {
  CryptoCoinDetail({
    required super.name,
    required super.priceInUSD,
    required super.imageURL,
    required this.toSymbol,
    required this.lastUpdate,
    required this.high24Hour,
    required this.low24Hours,
  });

  final String toSymbol;
  final DateTime lastUpdate;
  final double high24Hour;
  final double low24Hours;

  @override
  List<Object?> get props => [
        name,
        priceInUSD,
        imageURL,
        toSymbol,
        lastUpdate,
        high24Hour,
        low24Hours,
      ];
}
