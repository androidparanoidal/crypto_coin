import 'package:crypto_coin/features/crypto_list/crypto_list.dart';
import 'package:crypto_coin/features/crypto_coin/crypto_coin.dart';

final routes = {
  '/': (context) => CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
};
