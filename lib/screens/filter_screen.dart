import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
  final Map<filter, bool> currentFilters;
}

enum filter {
  glutenFree,
  lactoseFree,
  veganFree,
  vegetarFree,
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFreeFilter = false;
  bool _vegetarFreeFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilters[filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilters[filter.lactoseFree]!;
    _veganFreeFilter = widget.currentFilters[filter.veganFree]!;
    _vegetarFreeFilter = widget.currentFilters[filter.vegetarFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters "),
      ),
      // drawer: MainDrawer(
      //   onSelectedScreen: (indentifier) {
      //     Navigator.of(context).pop();
      //
      //     if (indentifier == 'Meals') {
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            filter.glutenFree: _glutenFreeFilter,
            filter.lactoseFree: _lactoseFreeFilter,
            filter.veganFree: _veganFreeFilter,
            filter.vegetarFree: _vegetarFreeFilter,
          });
          return false;
        },
        child: Column(
          children: [
            CustomSwitch(
              context,
              "Gluten Free",
              "Only include Gluten_Free Meals",
              (bool value) => setState(() => _glutenFreeFilter = value),
              _glutenFreeFilter,
            ),
            CustomSwitch(
              context,
              "Lactose Free",
              "Only include Lactose_Free Meals",
              (bool value) => setState(() => _lactoseFreeFilter = value),
              _lactoseFreeFilter,
            ),
            CustomSwitch(
              context,
              " Vegan",
              "Only include Vegan_Free Meals",
              (bool value) => setState(() => _veganFreeFilter = value),
              _veganFreeFilter,
            ),
            CustomSwitch(
              context,
              "Vegetar",
              "Only include Vegetar_Free Meals",
              (bool value) => setState(() => _vegetarFreeFilter = value),
              _vegetarFreeFilter,
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile CustomSwitch(
    BuildContext context,
    title,
    subtitle,
    Function(bool newValue) onChanged,
    bool filter,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
      value: filter,
      onChanged: onChanged,
    );
  }
}
