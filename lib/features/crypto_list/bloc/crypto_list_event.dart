part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable {
  get completer => null;
}

class LoadCryptoList extends CryptoListEvent {
  LoadCryptoList({this.completer});
  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
