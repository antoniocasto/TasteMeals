import 'package:flutter/material.dart';
import 'package:taste_meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  bool _vegan = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'vegetarian': _vegetarian,
                'lactose': _lactoseFree,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
          ), //usa widget. per acceder a valori fuori stato
        ],
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
