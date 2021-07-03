import 'package:flutter/material.dart';
import '../widgets/caregory_item.dart';
import '../models/dummy_data.dart';

class CatergoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      padding: const EdgeInsets.all(20),
      children: DUMMY_CATEGORIES
          .map((catdata) =>
              CategoryItem(catdata.title, catdata.color, catdata.id))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    ));
  }
}
