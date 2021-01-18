import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'models/app_state.dart';

import 'selectors/cocktail_selector.dart';

class CocktailDisplayModel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return StoreConnector<AppState, String>(
     converter: (Store<AppState> store) => cocktailNameSelector(store.state.cocktail),
     builder: (BuildContext context, String name) {
       return Text(name);
     },
   );
  }
}