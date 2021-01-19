import 'package:ctail_shaker/models/cocktail.dart';
import 'package:redux/redux.dart';
import 'package:ctail_shaker/actions/actions.dart';

final cocktailReducer = TypedReducer<List<Cocktail>, AddCocktail>(_addCocktailReducer);

List<Cocktail> _addCocktailReducer(List<Cocktail> cocktails, AddCocktail action) {
  return action.cocktails;
}