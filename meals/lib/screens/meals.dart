import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.meal,
      // required this.onFavouriteMeal
      });

  final String? title;
  final List<Meal> meal;
  // final void Function(Meal meal) onFavouriteMeal;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDataScreen(
          meal: meal,
          // onFavouriteMeal: onFavouriteMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (context, index) => MealItem(
        meal: meal[index],
        onSelectMeal: _selectMeal,
      ),
      itemCount: meal.length,
    );

    if (meal.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'oh uh .. Nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try Selecting a different Category!!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
