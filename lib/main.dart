import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'crypto_coin_app.dart';
import 'package:get_it/get_it.dart';
import 'repositories/crypto_coins/crypto_coins.dart';

void main() {
  GetIt.instance.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoCoinApp());
}
