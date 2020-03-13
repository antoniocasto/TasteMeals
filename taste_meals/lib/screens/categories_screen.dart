import 'package:flutter/material.dart';
import 'package:taste_meals/widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TasteMeals'),
      ),
      body: SafeArea(
        child: GridView(
          padding: const EdgeInsets.all(25),
          children: DUMMY_CATEGORIES
              .map((catData) => CategoryItem(
                    title: catData.title,
                    color: catData.color,
                    id: catData.id,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                200, //dimensione di ogni item. La grid viene costruita in base alla dimensione dell'item
            childAspectRatio: 3 / 2, //definisco le proporzioni dell'item
            crossAxisSpacing: 20, //per spazio tra item
            mainAxisSpacing: 20, //per spazio tra item
          ),
        ),
      ),
    );
  }
}
