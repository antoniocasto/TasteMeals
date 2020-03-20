import 'package:flutter/material.dart';
import 'package:meet_network_image/meet_network_image.dart';

import 'package:taste_meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail-screen';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    //Prenfo gli arguments
    //Con as String posso fare il cast
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: MeetNetworkImage(
                  imageUrl: selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                  loadingBuilder: (BuildContext context) => Container(
                    height: 300,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorBuilder: (BuildContext context, Object error) => Center(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.error),
                        Text('Network Error.')
                      ],
                    ),
                  ),
                ),
              ),
              _buildSectionTitle(context, 'Ingredients'),
              _buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 8.0,
                        ),
                        child: Text('${selectedMeal.ingredients[index]}'),
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              _buildSectionTitle(context, 'Steps'),
              _buildContainer(ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      color: Colors.black38,
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 200,
      width: 300,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      child: child,
    );
  }
}
