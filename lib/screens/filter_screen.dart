import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filter_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFreeFilter = false;
  bool _vegetarFreeFilter = false;

  @override
  void initState() {
    super.initState();
    final Map<filter, bool> ActiveFilters = ref.read(filtresProvider);
    _glutenFreeFilter = ActiveFilters[filter.glutenFree]!;
    _lactoseFreeFilter = ActiveFilters[filter.lactoseFree]!;
    _veganFreeFilter = ActiveFilters[filter.veganFree]!;
    _vegetarFreeFilter = ActiveFilters[filter.vegetarFree]!;
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
          ref.read(filtresProvider.notifier).setFilters({
            filter.glutenFree: _glutenFreeFilter,
            filter.lactoseFree: _lactoseFreeFilter,
            filter.veganFree: _veganFreeFilter,
            filter.vegetarFree: _vegetarFreeFilter,
          });
          return true;
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
