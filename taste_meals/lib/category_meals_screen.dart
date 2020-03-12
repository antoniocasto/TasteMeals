import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  //Qui sotto usati senza le route con una sola pagina
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    //Estraggo arguments del pushNamed
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: SafeArea(
        child: Center(
          child: Text('The recipes for a category'),
        ),
      ),
    );
  }
}
