import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../model/meal.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, required this.availableMeals})
      : super(key: key);
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2),
      children: [
        for (final valuCategory in availableCategories)
          CategoryGridItem(
            category: valuCategory,
            availableMeals: availableMeals,
          ),
      ],
    );
  }
}
