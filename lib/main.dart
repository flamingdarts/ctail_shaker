import 'package:ctail_shaker/models/cocktail.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'reducers/app_reducer.dart';
import 'models/app_state.dart';
import 'presentations/cocktail_list.dart';
import 'models/ingredient.dart';

void main() {
  final initialState = AppState(cocktails: [
    Cocktail(
      name: "Gin Tonic",
      description: "This cocktail is about to be awesome",
      imageUrl:
          "https://essenrezept.de/wp-content/uploads/2020/04/Mojito-Rezept.jpg",
      preparation: "Put it together and shake it yeah",
      author: "Jane",
      ingredients: [
        Ingredient(name: "Gin", amount: "3cl"),
        Ingredient(name: "Tonic", amount: "125 ml")
      ],
    ),
    Cocktail(
      name: "Pinacolada",
      description: "This cocktail is about to be awesome",
      imageUrl:
          "https://www.lecker.de/assets/styles/610x457/public/field/image/cocktails-b15.jpg?itok=WiWEoVFg",
      preparation: "Put it together and shake it yeah",
      author: "Jane",
      ingredients: [
        Ingredient(name: "Vodka", amount: "3cl"),
        Ingredient(name: "Bull", amount: "125 ml")
      ],
    ),
    Cocktail(
      name: "Test Cocktail",
      description: "This cocktail is about to be awesome",
      imageUrl:
          "https://essenrezept.de/wp-content/uploads/2020/04/Mojito-Rezept.jpg",
      preparation: "Put it together and shake it yeah",
      author: "Jane",
      ingredients: [
        Ingredient(name: "Gin", amount: "3cl"),
        Ingredient(name: "Tonic", amount: "125 ml")
      ],
    ),
    Cocktail(
      name: "Test Cocktail 2",
      description: "This cocktail is about to be awesome",
      imageUrl:
          "https://www.lecker.de/assets/styles/610x457/public/field/image/cocktails-b15.jpg?itok=WiWEoVFg",
      preparation: "Put it together and shake it yeah",
      author: "Jane",
      ingredients: [
        Ingredient(name: "Vodka", amount: "3cl"),
        Ingredient(name: "Bull", amount: "125 ml")
      ],
    ),
    Cocktail(
      name: "Test Cocktail",
      description: "This cocktail is about to be awesome",
      imageUrl:
          "https://essenrezept.de/wp-content/uploads/2020/04/Mojito-Rezept.jpg",
      preparation: "Put it together and shake it yeah",
      author: "Tom",
      ingredients: [
        Ingredient(name: "Gin", amount: "3cl"),
        Ingredient(name: "Tonic", amount: "125 ml")
      ],
    ),
    Cocktail(
      name: "Test Cocktail 2",
      description: "This cocktail is about to be awesome",
      imageUrl:
          "https://www.lecker.de/assets/styles/610x457/public/field/image/cocktails-b15.jpg?itok=WiWEoVFg",
      preparation: "Put it together and shake it yeah",
      author: "Tracy",
      ingredients: [
        Ingredient(name: "Vodka", amount: "3cl"),
        Ingredient(name: "Bull", amount: "125 ml")
      ],
    ),
  ]);

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
      theme: ThemeData(fontFamily: 'Rochester'),
      title: 'Ctail App',
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 24,
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
                label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.wine_bar_rounded,
                  color: Colors.white,
                  size: 24,
                ),
                label: "Favorite"),
          ],
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 24.0,
                ),
                Text(
                  "Stacy Stanley",
                  style: TextStyle(
                      fontFamily: "RockSalt",
                      fontSize: 12,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: CocktailList(),
          ),
        ),
      ),
    );
  }
}
