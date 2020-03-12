import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Recipes'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('The recipes for a category'),
        ),
      ),
    );
  }
}
