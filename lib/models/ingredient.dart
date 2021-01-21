import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class Ingredient {
  final String amount;
  final String name;

  const Ingredient({@required this.name, @required this.amount});

  Ingredient copyWith({String name, String amount }) {
    return Ingredient(
      name: name ?? this.name,
      amount: amount ?? this.amount,
    );
  }

  dynamic toJson() => {
    'name': name,
    'amount': amount,
  };

  @override
  String toString() {
    return 'Ingredient: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}