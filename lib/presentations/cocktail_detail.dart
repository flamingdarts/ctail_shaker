import 'dart:ui';

import 'package:ctail_shaker/keys.dart';
import 'package:ctail_shaker/models/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailDetail extends StatelessWidget {
  final Cocktail cocktail;
  final int index;

  CocktailDetail({
    Key key,
    @required this.cocktail,
    @required this.index,
  }) : super(key: key ?? ScreenKeys.cocktailScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Hero(
        tag: "cocktail$index",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 16,
              ),
              child: Image.network(
                  cocktail.imageUrl,
                  height: 300,
                ),
              ),
            Text(
              "Ingredients:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cocktail.ingredients.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(left: 64),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\u2022",
                                  style: TextStyle(fontSize: 32,color: Colors.white),
                                ),
                                Expanded(
                                  child: Text(
                                    cocktail.ingredients[index].name,
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    cocktail.ingredients[index].amount,
                                    style: TextStyle(fontSize: 18, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ));
                  }),
            ),
            Text(cocktail.preparation),
          ],
        ),
      ),
    );
  }
}
