import 'package:flutter/material.dart';
import '../widgets/main_drawe.dart';

class Filter extends StatefulWidget {
  final Function savefilter;
  final Map<String, bool> filterstate;

  Filter(this.filterstate, this.savefilter);
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var isGlutenFree = false;

  var isLactoseFree = false;

  var isVegan = false;

  var isVegetarian = false;

  @override
  initState() {
    isGlutenFree = widget.filterstate['gluten'];
    isLactoseFree = widget.filterstate['lactose'];
    isVegetarian = widget.filterstate['vegetarian'];
    isVegan = widget.filterstate['vegan'];
    super.initState();
  }

  Widget listtile(String text, String subt, var boll, Function changeval) {
    return SwitchListTile(
        title: Text(text),
        subtitle: Text(subt),
        value: boll,
        onChanged: changeval);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedfliters = {
                'gluten': isGlutenFree,
                'lactose': isLactoseFree,
                'vegetarian': isVegetarian,
                'vegan': isVegan
              };
              widget.savefilter(selectedfliters);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline1,
            ),
            alignment: Alignment.center,
          ),
          Expanded(
            child: ListView(
              children: [
                listtile('Gluten Free', 'Only Include Glutten Free Meal',
                    isGlutenFree, (newvalue) {
                  setState(() {
                    isGlutenFree = newvalue;
                  });
                }),
                listtile('Lactose Free', 'Only Include Lactose Free Meal',
                    isLactoseFree, (newvalue) {
                  setState(() {
                    isLactoseFree = newvalue;
                  });
                }),
                listtile(
                    'Vegetarian', 'Only Include Vegetarian Meal', isVegetarian,
                    (newvalue) {
                  setState(() {
                    isVegetarian = newvalue;
                  });
                }),
                listtile('Vegan', 'Only Include Vegan Meal', isVegan,
                    (newvalue) {
                  setState(() {
                    isVegan = newvalue;
                  });
                })
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
