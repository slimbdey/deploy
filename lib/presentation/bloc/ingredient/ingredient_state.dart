import 'package:hw/domain/entities/ingredient.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';

abstract class IngredientState {
  const IngredientState();
}

class IngredientInitialState extends IngredientState {
  const IngredientInitialState();
}

class IngredientLoadingState extends IngredientState {
  const IngredientLoadingState();
}

class IngredientsLoadedState extends IngredientState {
  final List<Ingredient> ingredients;

  const IngredientsLoadedState({required this.ingredients});
}

class IngredientsLoadedRecipeIngredientState extends IngredientState {
  final List<RecipeIngredient> recipeIngredients;

  const IngredientsLoadedRecipeIngredientState(
      {required this.recipeIngredients});
}

class IngredientErrorState extends IngredientState {
  final String message;

  const IngredientErrorState(this.message);
}
