import 'package:flutter/material.dart';
import '../models/meal_modal.dart';
import '../widgets/meal-item.dart';

class FavScreen extends StatelessWidget {
  final List<Meal> favmeals;

  FavScreen(this.favmeals);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favmeals.isEmpty
          ? Center(
              child: Text('You Have No FavMeals - start adding one'),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(favmeals[index]);
              },
              itemCount: favmeals.length,
            ),
    );
  }
}
