import 'package:flutter/material.dart';
import './models/dummy_data.dart';
import './models/meal_modal.dart';
import './screen/categoriesitem_screen.dart';
import './screen/categories_screen.dart';
import './screen/mealdetail_screen.dart';
import './screen/tabscreen..dart';
import './screen/filter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filterstate = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false
  };

  List<Meal> favmeals = [];
  void _setfilter(Map<String, bool> filterdata) {
    setState(() {
      filterstate = filterdata;
      availablemeals = DUMMY_MEALS.where((element) {
        if (filterstate['gluten'] && !element.isGlutenFree) {
          return false;
        }
        if (filterstate['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (filterstate['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (filterstate['vegan'] && !element.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool ismealfav(String id) {
    return favmeals.any((element) => element.id == id);
  }

  List<Meal> availablemeals = DUMMY_MEALS;
  void togglefav(String mealid) {
    final favindex = favmeals.indexWhere((element) => element.id == mealid);
    if (favindex >= 0) {
      setState(() {
        favmeals.removeAt(favindex);
      });
    } else {
      setState(() {
        favmeals.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealid),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.amberAccent,
          canvasColor: Color.fromRGBO(191, 191, 191, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              headline4: TextStyle(color: Color.fromRGBO(20, 51, 51, 0.8)),
              headline1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed'))),
      routes: {
        '/': (ctx) => TabsScreen(favmeals),
        '/categories-screen': (ctx) => CatergoriesScreen(),
        '/category-item': (ctx) => CategoriesItemScreen(availablemeals),
        '/mealdetail': (ctx) => MealDetail(togglefav, ismealfav),
        '/filter': (ctx) => Filter(filterstate, _setfilter)
      },
    );
  }
}
