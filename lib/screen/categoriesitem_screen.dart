import 'package:flutter/material.dart';
import '../models/meal_modal.dart';
import '../widgets/meal-item.dart';

class CategoriesItemScreen extends StatefulWidget {
  final List<Meal> avilablemeals;
  CategoriesItemScreen(this.avilablemeals);
  @override
  _CategoriesItemScreenState createState() => _CategoriesItemScreenState();
}

class _CategoriesItemScreenState extends State<CategoriesItemScreen> {
  var _loadeddata = false;
  String title;
  List<Meal> categorymeal;
  void result(String mealid) {
    setState(() {
      categorymeal.removeWhere((element) => element.id == mealid);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadeddata) {
      final routArg =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      final String id = routArg['id'];
      title = routArg['title'];
      categorymeal = widget.avilablemeals
          .where((element) => element.categories.contains(id))
          .toList();
      _loadeddata = true;
    }
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(categorymeal[index]);
          },
          itemCount: categorymeal.length,
        ));
  }
}
