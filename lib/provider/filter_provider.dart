import 'package:flutter_riverpod/flutter_riverpod.dart';

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
