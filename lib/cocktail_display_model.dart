import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'models/app_state.dart';

import 'selectors/cocktail_selector.dart';
import 'models/cocktail.dart';

class CocktailList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return StoreConnector<AppState, List<Cocktail>>(
     converter: (Store<AppState> store) => cocktailNameSelector(store.state.cocktails),
     builder: (BuildContext context, List<Cocktail> cocktails) {
       return ListView.builder(
         itemCount: cocktails.length,
         itemBuilder: (context, index) {
           return Container(
             margin: EdgeInsets.only(top: 10),
             decoration: BoxDecoration(
               color: Colors.amber,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
             ),
             child:  ListTile(
               title: Text(cocktails[index].name),
               subtitle: Text(cocktails[index].description),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.horizontal(right: Radius.circular(300)),
               ),
             ),
           );
         },
       );
     },
   );
  }
}