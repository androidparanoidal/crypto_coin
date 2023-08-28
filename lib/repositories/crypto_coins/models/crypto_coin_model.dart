import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.imageURl,
  });

  final String name;
  final double priceInUSD;
  final String imageURl;

  @override
  // TODO: implement props
  List<Object?> get props => [name, priceInUSD, imageURl];
}
