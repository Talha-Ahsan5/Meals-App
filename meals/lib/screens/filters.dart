import 'package:flutter/material.dart';
// import 'package:meals/widgets/main_drawer.dart';
// import 'package:meals/widgets/tabs.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum Filters {
//   glutenFree,
//   lactosFree,
//   vegetarian,
//   vegan,
// }

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

//   @override
//   ConsumerState<FiltersScreen> createState() {
//     return _FiltersScreenState();
//   }
// }

// class _FiltersScreenState extends ConsumerState<FiltersScreen> {
//   var _glutenFreeStatus = false;
//   var _lactosFreeStatus = false;
//   var _vegatarianFreeStatus = false;
//   var _veganFreeStatus = false;

  // @override
  // void initState() {
  //   final activeFilters = ref.read(filtersProvider);
  //   // TODO: implement initState
  //   super.initState();
  //   _glutenFreeStatus = activeFilters[Filters.glutenFree]!;
  //   _lactosFreeStatus = activeFilters[Filters.lactosFree]!;
  //   _vegatarianFreeStatus = activeFilters[Filters.vegetarian]!;
  //   _veganFreeStatus = activeFilters[Filters.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Favourites"),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == "meals") {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      // body: PopScope(
      //   canPop: true,
      //   onPopInvokedWithResult: (bool didPop, dynamic result) {
      //     // if (didPop) return;
      //     // Navigator.of(context).pop( //managed by filters provider
      //       // {
      //         ref.read(filtersProvider.notifier).setAllFilters({
      //         Filters.glutenFree: _glutenFreeStatus,
      //         Filters.lactosFree: _lactosFreeStatus,
      //         Filters.vegetarian: _vegatarianFreeStatus,
      //         Filters.vegan: _veganFreeStatus,
      //         });
      //       // }
      //     // );
      //   },
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filters.glutenFree]!,
            onChanged: (isChecked) {
              // setState(() {
              //   _glutenFreeStatus = isChecked;
              // });
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filters.glutenFree, isChecked);
            },
            title: Text(
              "Gluten-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "Only inculde Gluten-Free meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
          SwitchListTile(
            value: activeFilters[Filters.lactosFree]!,
            onChanged: (ischecked) {
              // setState(() {
              //   _lactosFreeStatus = ischecked;
              // });
              ref
                  .read(filtersProvider.notifier)
                  .setFilters(Filters.lactosFree, ischecked);
            },
            title: Text(
              "Lactos-Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "Only include Lactos-Free meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegetarian]!,
            onChanged: (ischecked) {
              // setState(
              //   () {
              //     _vegatarianFreeStatus = ischecked;
              //   },
              // );
              ref.read(filtersProvider.notifier).setFilters(Filters.vegetarian, ischecked);
            },
            title: Text(
              "Vegaterian",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "Only include Vegetarians' meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegan]!,
            onChanged: (ischecked) {
              // setState(
              //   () {
              //     _veganFreeStatus = ischecked;
              //   },
              // );
              ref.read(filtersProvider.notifier).setFilters(Filters.vegan, ischecked);
            },
            title: Text(
              "Vegan",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "Only include Vegan meals",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 24),
          )
        ],
      ),
    );
  }
}
