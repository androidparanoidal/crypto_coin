import 'package:dio/dio.dart';
import 'package:crypto_coin/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});
  final Dio dio; // client

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,SOL,DOGE&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageURL = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key,
        priceInUSD: price,
        imageURL: 'https://www.cryptocompare.com/$imageURL',
      );
    }).toList();
    return cryptoCoinsList;
  }

  // for 2nd screen
  @override
  Future<CryptoCoinDetail> getCoinDetails(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final price = usdData['PRICE'];
    final imageURL = usdData['IMAGEURL'];
    final toSymbol = usdData['TOSYMBOL'];
    final lastUpdate = usdData['LASTUPDATE'];
    final high24Hour = usdData['HIGH24HOUR'];
    final low24Hours = usdData['LOW24HOUR'];

    return CryptoCoinDetail(
      name: currencyCode,
      priceInUSD: price,
      imageURL: 'https://www.cryptocompare.com/$imageURL',
      toSymbol: toSymbol,
      lastUpdate: DateTime.fromMillisecondsSinceEpoch(lastUpdate),
      high24Hour: high24Hour,
      low24Hours: low24Hours,
    );
  }
}
