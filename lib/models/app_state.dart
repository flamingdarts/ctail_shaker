import 'dart:convert';

import 'package:meta/meta.dart';

import 'cocktail.dart';

@immutable
class AppState {
  final List<Cocktail> cocktails;

  const AppState({
    @required this.cocktails,
  });

  dynamic toJson() => {
    'cocktail': cocktails,
  };

  @override
  String toString() {
    return 'AppState: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}

