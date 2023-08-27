import 'package:flutter/material.dart';
import 'package:crypto_coin/theme/theme.dart';
import 'package:crypto_coin/router/router.dart';

class CryptoCoinApp extends StatelessWidget {
  const CryptoCoinApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Coin',
      theme: darkTheme,
      routes: routes,
    );
  }
}
