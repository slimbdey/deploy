import 'package:hw/domain/entities/comment.dart';

import 'recipe_ingredient.dart';
import 'recipe_step_link.dart';

class Recipe {
  final int id;
  final String name;
  int duration;
  final String photo;
  final List<RecipeIngredient> recipeIngredients;
  final List<RecipeStepLink> recipeSteps;

  Recipe({
    required this.id,
    required this.name,
    required this.duration,
    required this.photo,
    this.recipeIngredients = const [],
    this.recipeSteps = const [],
  });

  Recipe copyWith({
    int? id,
    String? name,
    int? duration,
    String? photo,
    List<RecipeIngredient>? ingredients,
    List<RecipeStepLink>? steps,
    List<Comment>? comments,
  }) {
    int? newDuration = steps?.fold<int?>(0, (prev, stepLink) {
      return (prev ?? 0) + stepLink.step.duration ~/ 60;
    });

    return Recipe(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: newDuration ?? this.duration,
      photo: photo ?? this.photo,
      recipeIngredients: ingredients ?? recipeIngredients,
      recipeSteps: steps ?? recipeSteps,
    );
  }
}
