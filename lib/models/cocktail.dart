import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class Cocktail {
  final String name;
  final String description;

  const Cocktail({@required this.name, @required this.description});

  Cocktail copyWith({String name, String description}) {
    return Cocktail(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  dynamic toJson() => {
        'name': name,
        'description': description,
      };

  @override
  String toString() {
    return 'Cocktail: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
