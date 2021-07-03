import 'package:flutter/material.dart';
import '../models/meal_modal.dart';

class MealDetail extends StatelessWidget {
  final Function togglefav;
  final Function ismealfav;
  MealDetail(this.togglefav, this.ismealfav);
  Widget _textwidget(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.02,
              blurRadius: 10.0,
            )
          ],
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget _texttitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.02,
              blurRadius: 10.0,
            )
          ],
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10)),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }

  Widget _listcont(BuildContext context, List list) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 35),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.02,
              blurRadius: 10.0,
            )
          ],
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 10,
                ),
                title: Text(list[index]),
              ),
              Divider(
                thickness: 3,
              )
            ],
          );
        },
        itemCount: list.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal routArg = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(routArg.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                routArg.imageUrl,
                fit: BoxFit.contain,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 0.02,
                    blurRadius: 10.0,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _textwidget(context, routArg.title),
            _texttitle(context, 'Ingredients'),
            _listcont(context, routArg.ingredients),
            SizedBox(
              height: 20,
            ),
            _texttitle(context, 'Steps'),
            _listcont(context, routArg.steps),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            (ismealfav(routArg.id)) ? Icons.favorite : Icons.favorite_border),
        splashColor: Colors.pink,
        onPressed: () {
          togglefav(routArg.id);
        },
      ),
    );
  }
}
