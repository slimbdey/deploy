import 'ingredient.dart';

class RecipeIngredient {
  final int id;
  final int count;
  final Ingredient ingredient;

  RecipeIngredient({
    required this.id,
    required this.count,
    required this.ingredient,
  });
}
