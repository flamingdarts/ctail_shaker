import 'dart:convert';
import 'package:ctail_shaker/models/ingredient.dart';
import 'package:meta/meta.dart';

@immutable
class Cocktail {
  final String name;
  final String description;
  final String imageUrl;
  final String preparation;
  final String author;
  final List<Ingredient> ingredients;

  const Cocktail({@required this.name,
    @required this.description,
    @required this.imageUrl,
    @required this.preparation,
    @required this.author,
    @required this.ingredients,
  });

  Cocktail copyWith({String name,
    String description,
    String url,
    String preparation,
    String author,
    List<Ingredient> ingredients}) {
    return Cocktail(
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: url ?? this.imageUrl,
      preparation: preparation ?? this.preparation,
      author: author ?? this.author,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  dynamic toJson() =>
      {
        'name': name,
        'description': description,
        'url': imageUrl,
        'author': author,
        'ingredients': ingredients,
      };

  @override
  String toString() {
    return 'Cocktail: ${JsonEncoder.withIndent('  ').convert(this)}';
  }
}
