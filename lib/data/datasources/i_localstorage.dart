import 'package:hw/data/datasources/i_datasource.dart';
import 'package:hw/data/dtos/comment_dto.dart';
import 'package:hw/data/dtos/favorite_dto.dart';
import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/data/dtos/recipe_ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/data/dtos/recipe_step_link_dto.dart';

abstract class ILocalStorage extends IDatasource {
  Future<void> initComments(List<CommentDto> value);
  Future<void> initRecipes(List<RecipeDto> value);
  Future<void> initSteps(List<RecipeStepDto> value);
  Future<void> initStepLinks(List<RecipeStepLinkDto> value);
  Future<void> initIngredients(List<IngredientDto> value);
  Future<void> initRecipeIngredients(List<RecipeIngredientDto> value);
  Future<void> initMeasureUnits(List<MeasureUnitDto> value);
  Future<void> initFavorites(List<FavoriteDto> value);
  Future<List<CommentDto>> getUnsyncedComments();
  Future<List<RecipeDto>> getUnsyncedRecipes();
  Future<List<RecipeStepDto>> getUnsyncedSteps();
  Future<List<RecipeStepLinkDto>> getUnsyncedStepLinks();
  Future<List<IngredientDto>> getUnsyncedIngredients();
  Future<List<RecipeIngredientDto>> getUnsyncedRecipeIngredients();
  Future<List<MeasureUnitDto>> getUnsyncedMeasureUnits();
  Future<List<FavoriteDto>> getUnsyncedFavorites();
  Future<void> clear();
  Future<List<dynamic>?> getContents();
}
