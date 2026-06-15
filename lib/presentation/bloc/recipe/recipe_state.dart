import 'package:hw/domain/entities/recipe.dart';

abstract class RecipeState {
  const RecipeState();
}

class RecipeInitialState extends RecipeState {
  const RecipeInitialState();
}

class RecipeLoadingState extends RecipeState {
  const RecipeLoadingState();
}

class RecipesLoadedState extends RecipeState {
  final List<Recipe> recipes;

  const RecipesLoadedState({required this.recipes});
}

class RecipeUpdatedState extends RecipeState {
  final Recipe recipe;

  const RecipeUpdatedState({required this.recipe});
}

class RecipeErrorState extends RecipeState {
  final String message;

  const RecipeErrorState(this.message);
}
