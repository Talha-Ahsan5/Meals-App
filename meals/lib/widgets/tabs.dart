import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/data/dummy_data.dart';
// import 'package:meals/models/meals.dart';
import 'package:meals/providers/favourite_provider.dart';
// import 'package:meals/providers/meal_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';

const kinitialFilters = {
  Filters.glutenFree: false,
  Filters.lactosFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  // final List<Meal> _favouritemeal = [];
  // Map<Filters, bool> _selectedFilters = kinitialFilters;

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  // void _toggleFavouriteMealStatus(Meal meal) {
  //   final isExisting = _favouritemeal.contains(meal);

  //   setState(() {
  //     if (isExisting) {                                        //Replaced by Provider class given by riverpod
  //       _favouritemeal.remove(meal);
  //       _showInfoMessage('This Meal is no longer favourite!');
  //     } else {
  //       _favouritemeal.add(meal);
  //       _showInfoMessage('This Meal is added in favourites!');
  //     }
  //   });
  // }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); // for automatically closing drawer
    if (identifier == "filters") {
      //  final result =
       await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(
            // currentFilters: _selectedFilters,
          ),
        ),
      );
      // setState(() {
      //   _selectedFilters = result ?? kinitialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final foods = ref.watch(mealProvider);
    // final activeFilters = ref.watch(filtersProvider);
    // final availableMeals = foods.where(
    //   (meal) {
    //     if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) { //_selectedFilters is replaced by activeFilters => filtersProvider class
    //       return false;
    //     }
    //     if (activeFilters[Filters.lactosFree]! && !meal.isLactoseFree) {
    //       return false;
    //     }
    //     if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
    //       return false;
    //     }
    //     if (activeFilters[Filters.vegan]! && !meal.isVegan) {
    //       return false;
    //     }
    //     return true;
    //   },
    // ).toList();
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(
      // onFavouriteMeal: _toggleFavouriteMealStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Pick your categories';

    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealProvider);
      activePage = MealsScreen(
        // title: 'Favourites',
        // meal: _favouritemeal,
        meal: favouriteMeals,
        // onFavouriteMeal: _toggleFavouriteMealStatus,
      );
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
