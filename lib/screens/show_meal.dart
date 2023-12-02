import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../model/meal.dart';

class ShowMealScreen extends StatelessWidget {
  const ShowMealScreen({
    Key? key,
    this.title,
    required this.meal,
  }) : super(key: key);
  final String? title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meal
            .map((meal) => MealItem(
                  meal: meal,
                  onSelectMeal: (Meal meal) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MealDetailsScreen(
                          meal: meal,
                        ),
                      ),
                    );
                  },
                ))
            .toList(),
      ),
    );
  }
}
