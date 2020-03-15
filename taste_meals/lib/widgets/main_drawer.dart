import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          _buildContainer(context),
          SizedBox(
            height: 20,
          ),
          _buildListTile('Meals', Icons.restaurant),
          _buildListTile('Filters', Icons.settings),
        ],
      ),
    );
  }

  Container _buildContainer(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.centerLeft,
      color: Theme.of(context).accentColor,
      child: Text('Cooking Up!',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Theme.of(context).primaryColor,
          )),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        //...
      },
    );
  }
}
