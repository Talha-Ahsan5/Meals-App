import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meals.dart';


class FavouriteProviderNotifier extends StateNotifier<List<Meal>>{
  FavouriteProviderNotifier() : super([]);

  bool toggleFavouriteMealStatus(Meal meal){
    final mealIsFavourite = state.contains(meal);

    if(mealIsFavourite){
      state = state.where((element) => element.id!=meal.id,).toList();
      return false;
    }
    else{
      state = [... state, meal];
      return true;
    }
  }

}

final favouriteMealProvider = StateNotifierProvider<FavouriteProviderNotifier, List<Meal>>((ref){
  return FavouriteProviderNotifier();
});