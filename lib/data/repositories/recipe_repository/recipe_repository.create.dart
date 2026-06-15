import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/data/dtos/recipe_ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/data/dtos/recipe_step_link_dto.dart';
import 'package:hw/data/repositories/recipe_repository/index.dart';

extension RecipeRepositoryCreate on RecipeRepository {
  Future<T> _create<T>(
    T value,
    Future<T> Function(T value) callbackNetwork,
    Future<T> Function(T value) callbackLocal,
  ) async {
    final created =
        isOffline ? await callbackLocal(value) : await callbackNetwork(value);

    return created;
  }

  Future<RecipeDto> createRecipe(RecipeDto value) =>
      _create(value, datasource.addRecipe, localsource.addRecipe);

  Future<RecipeStepDto> createStep(RecipeStepDto value) =>
      _create(value, datasource.addStep, localsource.addStep);

  Future<RecipeStepLinkDto> createStepLink(RecipeStepLinkDto value) =>
      _create(value, datasource.addStepLink, localsource.addStepLink);

  Future<IngredientDto> createIngredient(IngredientDto value) =>
      _create(value, datasource.addIngredient, localsource.addIngredient);

  Future<RecipeIngredientDto> createRecipeIngredient(
    RecipeIngredientDto value,
  ) =>
      _create(
        value,
        datasource.addRecipeIngredient,
        localsource.addRecipeIngredient,
      );
}
