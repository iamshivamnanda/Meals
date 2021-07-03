import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  CategoryItem(this.title, this.color, this.id);

  void selectnewscreen(BuildContext context) {
    Navigator.of(context).pushNamed('/category-item',
        arguments: {'title': title, 'color': color, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectnewscreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
