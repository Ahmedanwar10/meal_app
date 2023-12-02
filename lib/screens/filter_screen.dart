import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<filter, bool> ActtiveFilters = ref.watch(filtresProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters "),
      ),
      body: Column(
        children: [
          CustomSwitch(
            context,
            "Gluten Free",
            "Only include Gluten_Free Meals",
            (bool value) {
              ref
                  .read(filtresProvider.notifier)
                  .setFilter(filter.glutenFree, value);
            },
            ActtiveFilters[filter.glutenFree]!,
          ),
            CustomSwitch(
            context,
            "Lactose Free",
            "Only include Lactose_Free Meals",
            (bool value) {
              ref
                  .read(filtresProvider.notifier)
                  .setFilter(filter.lactoseFree, value);
            },
            ActtiveFilters[filter.lactoseFree]!,
          ),
            CustomSwitch(
            context,
            " Vegan",
            "Only include Vegan_Free Meals",
            (bool value) {
              ref
                  .read(filtresProvider.notifier)
                  .setFilter(filter.veganFree, value);
            },
            ActtiveFilters[filter.veganFree]!,
          ),
            CustomSwitch(
            context,
            "Vegetar",
            "Only include Vegetar_Free Meals",
            (bool value) {
              ref
                  .read(filtresProvider.notifier)
                  .setFilter(filter.vegetarFree, value);
            },
            ActtiveFilters[filter.vegetarFree]!,
          ),
        ],
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
