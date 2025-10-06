// import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/providers/favourite_provider.dart';
import 'package:meals/providers/meal_provider.dart';

enum Filters {
  glutenFree,
  lactosFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactosFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
        });

  void setFilters(Filters filters, bool isActive) {
    // state[filters] = isActive; // not allowed => mutating

    state = {
      ...state,
      filters: isActive,
    };
  }

  void setAllFilters(Map<Filters, bool> choosenFilters){
    state = choosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>((ref) {
  return FiltersNotifier();
});


final filteredMealsProvider = Provider((ref){
  final foods = ref.watch(mealProvider);
  final activeFilters = ref.watch(filtersProvider);
  return foods.where(
      (meal) {
        if (activeFilters[Filters.glutenFree]! && !meal.isGlutenFree) { //_selectedFilters is replaced by activeFilters => filtersProvider class
          return false;
        }
        if (activeFilters[Filters.lactosFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (activeFilters[Filters.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (activeFilters[Filters.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();
});
