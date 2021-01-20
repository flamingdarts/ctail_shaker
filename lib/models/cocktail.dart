import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class Cocktail {
  final String name;
  final String description;
  final String imageUrl;

  const Cocktail(
      {@required this.name, @required this.description, @required this.imageUrl});

  Cocktail copyWith({String name, String description, String url}) {
    return Cocktail(
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: url ?? this.imageUrl,
    );
  }

  dynamic toJson() => {
        'name': name,
        'description': description,
        'url': imageUrl,
      };

  @override
  String toString() {
    return 'Cocktail: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
