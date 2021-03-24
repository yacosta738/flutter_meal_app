import 'package:first_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal section',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buildSwitchListTile('lactose-free',
                    'Only include lactose-free meals.', _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _vegan, (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
}
