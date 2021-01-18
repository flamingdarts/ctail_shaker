import 'package:ctail_shaker/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'reducers/app_reducer.dart';
import 'models/app_state.dart';
import 'cocktail_display_model.dart';

void main() {
  final initialState = AppState(
    cocktail: Cocktail(
      name: "Test Cocktail"
    ),
  );

  final store = Store<AppState>(
    appReducer,
    initialState: initialState,
    middleware: [new LoggingMiddleware.printer()],
  );

  print('Initial state: ${store.state}');

  runApp(StoreProvider(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Ctail App',
     home: Scaffold(
       appBar: AppBar(
         title: Text('Ctail Shaker'),
       ),
       body: Padding(
         padding: EdgeInsets.all(20),
         child: ListView(
           children: <Widget>[
             Container(
               color: Colors.amber,
               padding: EdgeInsets.only(top: 10, bottom: 10),
               child: Column(
                 children: <Widget>[
                   CocktailDisplayModel(),
                 ],
               ),
             )
           ],
         ),
       ),
     ),
   );
  }
}
