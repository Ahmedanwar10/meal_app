import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/show_meal.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../model/meal.dart';

const KInitialFilter = {
  filter.glutenFree: false,
  filter.lactoseFree: false,
  filter.veganFree: false,
  filter.vegetarFree: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMel = [];
  Map<filter, bool> _selectedFilter = KInitialFilter;

  void _showInfoMassage(String massage) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massage),
      ),
    );
  }

  void _setScreen(String indentifier) {
    if (indentifier == 'Filters') {
      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FilterScreen(currentFilters: _selectedFilter),
        ),
      ).then((value) => setState(
            () => _selectedFilter = value ?? KInitialFilter,
          ));
    }
  }

  void _toggeleMealfavoriteStates(Meal meal) {
    final isExisting = _favouriteMel.contains(meal);
    if (isExisting) {
      setState(() {
        _favouriteMel.remove(meal);
      });
      _showInfoMassage("Meal is no longer a favorite .");
    } else {
      setState(() {
        _favouriteMel.add(meal);
      });
      _showInfoMassage("Maked as a favorite !");
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectedFilter[filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[filter.veganFree]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilter[filter.vegetarFree]! && !meal.isVegetarian) {
        return false;
      }

      return true;
    }).toList();
    Widget ActivePage = CategoriesScreen(
      onToggleFavorite: _toggeleMealfavoriteStates,
      availableMeals: availableMeals,
    );
    var ActivePageTitle = 'Pick your Category';
    if (_selectedPageIndex == 1) {
      ActivePage = ShowMealScreen(
        meal: _favouriteMel,
        onToggleFavorite: _toggeleMealfavoriteStates,
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
