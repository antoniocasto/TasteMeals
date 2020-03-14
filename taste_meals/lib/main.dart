import 'package:flutter/material.dart';
import 'package:taste_meals/screens/category_meals_screen.dart';
import 'package:taste_meals/screens/meal_detail_screen.dart';

import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TasteMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: Theme.of(context)
            .textTheme
            .apply(
              fontFamily: 'Raleway',
            )
            .copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/', //default is '/'
      routes: {
        '/': (ctx) =>
            CategoriesScreen(), //o questo con initialRoute oppure Home, altrimenti non funziona
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        //Raggiunta in caso si verifichi un qualunque problema con le altre route
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
