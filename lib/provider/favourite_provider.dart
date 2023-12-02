import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/model/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toggeleMealfavoriteStates(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state.where((element) => element.id != meal.id).toString();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }

    // _showInfoMassage("Maked as a favorite !");
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});
