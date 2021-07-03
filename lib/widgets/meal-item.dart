import 'package:flutter/material.dart';
import '../models/meal_modal.dart';

class MealItem extends StatelessWidget {
  final Meal categorymeal;
  MealItem(this.categorymeal);

  void selectmeal(BuildContext context) {
    Navigator.of(context).pushNamed('/mealdetail', arguments: categorymeal);
  }

  String get complexitytext {
    switch (categorymeal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'N/A';
    }
  }

  String get affordabilitytext {
    switch (categorymeal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'N/A';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: () => selectmeal(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: Image.network(
                    categorymeal.imageUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.all(20),
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                    child: FittedBox(
                      child: Text(
                        categorymeal.title,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ]),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(
                            width: 6,
                          ),
                          Text('${categorymeal.duration}')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(
                            width: 6,
                          ),
                          Text(complexitytext)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.monetization_on),
                          SizedBox(
                            width: 6,
                          ),
                          Text(affordabilitytext)
                        ],
                      )
                    ],
                  ))
            ],
          ),
          elevation: 10,
        ),
      ),
    );
  }
}
