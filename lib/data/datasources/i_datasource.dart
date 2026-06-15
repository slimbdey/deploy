import 'package:hw/data/dtos/comment_dto.dart';
import 'package:hw/data/dtos/favorite_dto.dart';
import 'package:hw/data/dtos/freezer_dto.dart';
import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/data/dtos/recipe_ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/data/dtos/recipe_step_link_dto.dart';

abstract class IDatasource {
  Future<List<RecipeDto>> getRecipes();
  Future<RecipeDto> addRecipe(RecipeDto value);
  Future<void> deleteRecipe(int id);

  Future<List<RecipeStepDto>> getSteps();
  Future<RecipeStepDto> addStep(RecipeStepDto value);
  Future<void> deleteStep(int id);

  Future<List<RecipeIngredientDto>> getRecipeIngredients();
  Future<RecipeIngredientDto> addRecipeIngredient(RecipeIngredientDto value);
  Future<void> deleteRecipeIngredient(int id);

  Future<List<RecipeStepLinkDto>> getStepLinks();
  Future<RecipeStepLinkDto> addStepLink(RecipeStepLinkDto value);
  Future<void> deleteStepLink(int id);

  Future<List<IngredientDto>> getIngredients();
  Future<IngredientDto> addIngredient(IngredientDto value);
  Future<void> deleteIngredient(int id);

  Future<List<FreezerDto>> getFreezer();

  Future<List<MeasureUnitDto>> getMeasureUnits();
  Future<MeasureUnitDto> addMeasureUnit(MeasureUnitDto value);

  Future<List<FavoriteDto>> getFavorites();
  Future<FavoriteDto> addFavorite(FavoriteDto value);
  Future<void> deleteFavorite(int id);

  Future<CommentDto> addComment(CommentDto value);
  Future<List<CommentDto>> getComments(int recipeId);
}
