import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/show_meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../model/meal.dart';
import '../provider/favourite_provider.dart';
import '../provider/filter_provider.dart';
import '../provider/meal_provider.dart';


class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const String routName = "Tabs_Screen";

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMel = [];

  void _showInfoMassage(String massage) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massage),
      ),
    );
  }

  void _setScreen(String _indentifier) {
    if (_indentifier == 'Filters') {
      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FilterScreen(),
        ),
      );
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final Map<filter, bool> ActtiveFilters = ref.watch(filtresProvider);
    final availableMeals = meals.where((meal) {
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
    Widget ActivePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var ActivePageTitle = 'Pick your Category';
    if (_selectedPageIndex == 1) {
      final List<Meal> favouriteMeal = ref.watch(favoriteMealsProvider);
      ActivePage = ShowMealScreen(
        meal: favouriteMeal,
      );
      ActivePageTitle = 'Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(ActivePageTitle),
      ),
      body: ActivePage,
      drawer: MainDrawer(
        onSelectedScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorite"),
        ],
      ),
    );
  }
}
