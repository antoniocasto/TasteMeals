import 'package:flutter/material.dart';
import 'package:taste_meals/dummy_data.dart';
import 'package:taste_meals/screens/category_meals_screen.dart';
import 'package:taste_meals/screens/filters_screen.dart';
import 'package:taste_meals/screens/meal_detail_screen.dart';
import 'package:taste_meals/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'lactose': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
            TabsScreen(), //o questo con initialRoute oppure Home, altrimenti non funziona
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, _filters),
      },
      onUnknownRoute: (settings) {
        //Raggiunta in caso si verifichi un qualunque problema con le altre route
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
