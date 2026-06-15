import 'package:hw/domain/entities/recipe.dart';

abstract class RecipeEvent {
  const RecipeEvent();
}

class RecipesLoadEvent extends RecipeEvent {
  const RecipesLoadEvent();
}

class RecipesAddEvent extends RecipeEvent {
  final Recipe recipe;

  const RecipesAddEvent(this.recipe);
}

class RecipesUpdateEvent extends RecipeEvent {
  final Recipe recipe;

  const RecipesUpdateEvent(this.recipe);
}
