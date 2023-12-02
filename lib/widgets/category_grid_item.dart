import 'package:flutter/material.dart';
import 'package:meal_app/model/category.dart';
import 'package:meal_app/model/meal.dart';

import '../screens/show_meal.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {Key? key,
      required this.category,
      required this.availableMeals})
      : super(key: key);
  final Category category;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final List<Meal> FilterMeal = availableMeals
            .where(
              (meal) => meal.categories.contains(category.id),
            )
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ShowMealScreen(
            title: category.title,
            meal: FilterMeal,
          ),
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
