import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class Cocktail {
  final String name;

  const Cocktail({@required this.name});

  Cocktail copyWith({String name}) {
    return Cocktail(
      name: name ?? this.name,
    );
  }

  dynamic toJson() => {
        'name': name,
      };

  @override
  String toString() {
    return 'Cocktail: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
