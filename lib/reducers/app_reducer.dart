import '../models/app_state.dart';
import '../reducers/cocktail_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    cocktails: cocktailReducer(state.cocktails, action),
  );
}