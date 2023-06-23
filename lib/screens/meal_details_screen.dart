import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';

class MealDetalsScreen extends StatelessWidget {
  const MealDetalsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorite(meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 14),
                Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                for (final ingredient in meal.ingredients)
                  Text(ingredient,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          )),
                const SizedBox(height: 14),
                Text(
                  'Steps',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                for (final step in meal.steps)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Text('-  $step',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            )),
                  )
              ],
            ),
          )),
    );
  }
}
