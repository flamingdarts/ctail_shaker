import 'package:ctail_shaker/models/cocktail.dart';
import 'package:redux/redux.dart';
import 'package:ctail_shaker/actions/actions.dart';

final cocktailReducer = TypedReducer<Cocktail, AddCocktail>(_addCocktailReducer);

Cocktail _addCocktailReducer(Cocktail state, AddCocktail action) {
  return action.cocktail;
}