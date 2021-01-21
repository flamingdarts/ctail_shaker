import 'dart:ui';

import 'package:ctail_shaker/keys.dart';
import 'package:ctail_shaker/models/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailDetail extends StatelessWidget {
  final Cocktail cocktail;

  CocktailDetail({
    Key key,
    @required this.cocktail,
  }) : super(key: key ?? ScreenKeys.cocktailScreen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cocktail.name),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 16,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.network(
                cocktail.imageUrl,
                height: 300,
                width: 300,
              ),
            ),
          ),
          Text(
            "Ingredients:",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                                style: TextStyle(fontSize: 32),
                              ),
                              Expanded(
                                child: Text(
                                  cocktail.ingredients[index].name,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  cocktail.ingredients[index].amount,
                                  style: TextStyle(fontSize: 18),
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
    );
  }
}
