import 'package:ctail_shaker/presentations/cocktail_detail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
      distinct: true,
      converter: (Store<AppState> store) =>
          cocktailListSelector(store.state),
      builder: (BuildContext context, List<Cocktail> cocktails) {
        return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: cocktails.length,
          itemBuilder: (context, index) {
            return SizedBox(
              child: Hero(
                tag: "cocktail$index",
                child: Card(
                    child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return CocktailDetail(
                            cocktail: cocktails[index], index: index);
                      }),
                    );
                  },
                  child: Image.network(
                    cocktails[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                )),
              ),
            );
          },
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, 2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        );
      },
    );
  }
}
