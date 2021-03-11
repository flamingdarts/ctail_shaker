import 'package:ctail_shaker/presentations/cocktail_detail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models/app_state.dart';

import '../selectors/cocktail_selector.dart';
import '../models/cocktail.dart';

class CocktailList extends StatefulWidget {
  @override
  _CocktailListState createState() => _CocktailListState();
}

class _CocktailListState extends State<CocktailList> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Cocktail>>(
      distinct: true,
      converter: (Store<AppState> store) => cocktailListSelector(store.state),
      builder: (BuildContext context, List<Cocktail> cocktails) {
        return StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: cocktails.length,
          itemBuilder: (context, index) {
            return SizedBox(
              child: Hero(
                tag: "cocktail$index",
                child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      child: GridTile(
                        header: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  const Color(0x90000000),
                                  const Color(0x15212121),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Text(cocktails[index].name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 36,
                                  )),
                              trailing: IconButton(
                                icon: new Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                                color: Colors.white,),
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        footer: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  const Color(0x90000000),
                                  const Color(0x15212121),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              )
                          ),
                          child: ListTile(
                            leading: Text(
                                "BY ${cocktails[index].author.toUpperCase()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'RockSalt')),
                          ),
                        ),
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
                        ),
                      ),
                    )),
              ),
            );
          },
          staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        );
      },
    );
  }
}
