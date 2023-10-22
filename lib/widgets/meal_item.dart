import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal, required this.onSelectMeal})
      : super(key: key);
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    switch (Complexity) {
      case Complexity.simple:
        return "Simple";
        break;
      case Complexity.challenging:
        return "Challenging";
        break;
      case Complexity.hard:
        return "Hard";
        break;
      default:
        return "UnKnown";
    }
  }

  String get affordabilityText {
    switch (Affordability) {
      case Affordability.affordable:
        return "affordable";
        break;
      case Affordability.pricey:
        return "pricey";
        break;
      case Affordability.luxurious:
        return "luxurious";
        break;
      default:
        return "UnKnown";
    }
  }

  get duration => meal;

  void selectmeal() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: const RoundedRectangleBorder(),
      child: InkWell(
        onTap: () => onSelectMeal(meal),
        child: Stack(
          children: [
            Image.network(meal.imageUrl),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.schedule),
                              SizedBox(
                                width: 4,
                              ),
                              Text("$duration min"),
                            ],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Row(
                            children: [
                              Icon(Icons.work),
                              Text(complexityText),
                            ],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Row(
                            children: [
                              Icon(Icons.attach_money),
                              Text(affordabilityText),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
