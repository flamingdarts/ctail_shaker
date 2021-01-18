import 'dart:convert';

import 'package:meta/meta.dart';

import 'cocktail.dart';

@immutable
class AppState {
  final Cocktail cocktail;

  const AppState({
    @required this.cocktail,
  });

  dynamic toJson() => {
    'cocktail': cocktail,
  };

  @override
  String toString() {
    return 'AppState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}

