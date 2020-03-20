import 'package:flutter/material.dart';
import 'package:taste_meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  bool _vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      title: 'Gluten-free',
                      subtitle: 'Only include Gluten-free meals.',
                      currentValue: _glutenFree,
                      updateValue: (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      }),
                  _buildSwitchListTile(
                      title: 'Lactose-free',
                      subtitle: 'Only include Lactose-free meals.',
                      currentValue: _lactoseFree,
                      updateValue: (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      }),
                  _buildSwitchListTile(
                      title: 'Vegetarian',
                      subtitle: 'Only include Vegetarian meals.',
                      currentValue: _vegetarian,
                      updateValue: (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      }),
                  _buildSwitchListTile(
                    currentValue: _vegan,
                    title: 'Vegan',
                    subtitle: 'Only include Vegan meals.',
                    updateValue: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchListTile({
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  }) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      subtitle: Text(
        subtitle,
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
