import 'package:flutter/material.dart';
import 'package:taste_meals/category_item.dart';

import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TasteMeals'),
      ),
      body: GridView(
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(title: catData.title, color: catData.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              200, //dimensione di ogni item. La grid viene costruita in base alla dimensione dell'item
          childAspectRatio: 3 / 2, //definisco le proporzioni dell'item
          crossAxisSpacing: 20, //per spazio tra item
          mainAxisSpacing: 20, //per spazio tra item
        ),
      ),
    );
  }
}
