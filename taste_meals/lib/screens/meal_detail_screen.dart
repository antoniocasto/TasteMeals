import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';

  @override
  Widget build(BuildContext context) {
    //Prenfo gli arguments
    //Con as String posso fare il cast
    final mealId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('$mealId'),
      ),
      body: SafeArea(
        child: Text('Id is $mealId'),
      ),
    );
  }
}
