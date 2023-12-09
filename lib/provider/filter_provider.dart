import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meal_provider.dart';

enum filter {
  glutenFree,
  lactoseFree,
  veganFree,
  vegetarFree,
}

class FilterNotifier extends StateNotifier<Map<filter, bool>> {
  FilterNotifier()
      : super({
          filter.glutenFree: false,
          filter.lactoseFree: false,
          filter.veganFree: false,
          filter.vegetarFree: false,
        });

  void setFilters(Map<filter, bool> chodenFilter) {
    state = chodenFilter;
  }

  void setFilter(filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtresProvider =
    StateNotifierProvider<FilterNotifier, Map<filter, bool>>(
        (ref) => FilterNotifier());

final filtresMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final Map<filter, bool> ActtiveFilters = ref.watch(filtresProvider);

  return meals.where((meal) {
    if (ActtiveFilters[filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (ActtiveFilters[filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (ActtiveFilters[filter.veganFree]! && !meal.isVegan) {
      return false;
    }
    if (ActtiveFilters[filter.vegetarFree]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});