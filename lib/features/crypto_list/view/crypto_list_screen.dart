import 'package:flutter/material.dart';
import 'package:crypto_coin/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_coin/repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Coin'),
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final coin = _cryptoCoinsList![index];
                return CryptoCoinTile(coin: coin);
              },
            ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList =
        await GetIt.instance<AbstractCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
