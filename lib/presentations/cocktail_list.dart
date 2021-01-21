import 'package:ctail_shaker/presentations/cocktail_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models/app_state.dart';

import '../selectors/cocktail_selector.dart';
import '../models/cocktail.dart';

class CocktailList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Cocktail>>(
      converter: (Store<AppState> store) =>
          cocktailNameSelector(store.state.cocktails),
      builder: (BuildContext context, List<Cocktail> cocktails) {
        return ListView.builder(
          itemCount: cocktails.length,
          itemBuilder: (context, index) {
            return Card(
                child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return CocktailDetail(cocktail: cocktails[index]);
                  }),
                );
              },
              child: Column(
                children: <Widget>[
                  Image.network(
                    cocktails[index].imageUrl,
                    fit: BoxFit.contain,
                  ),
                  ListTile(
                    title: Text(cocktails[index].name),
                    subtitle: Text(cocktails[index].description),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(10)),
                    ),
                  ),
                ],
              ),
            ));
          },
        );
      },
    );
  }
}
