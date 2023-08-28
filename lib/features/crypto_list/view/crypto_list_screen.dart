import 'dart:async';

import 'package:flutter/material.dart';
import 'package:crypto_coin/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_coin/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:crypto_coin/features/crypto_list/bloc/crypto_list_bloc.dart';

class CryptoListScreen extends StatefulWidget {
  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(
    GetIt.instance<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Coin'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.coinsList.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  final coin = state.coinsList[index];
                  return CryptoCoinTile(coin: coin);
                },
              );
            }

            if (state is CryptoListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Something went wrong'),
                    TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCryptoList());
                      },
                      child: const Text('Try again'),
                    ),
                  ],
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
