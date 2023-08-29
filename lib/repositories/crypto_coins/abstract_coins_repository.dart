import 'package:crypto_coin/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:crypto_coin/repositories/crypto_coins/models/coin_details_model.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoinDetail> getCoinDetails(String currencyCode);
}
