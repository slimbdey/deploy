import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/data/dtos/recipe_ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/data/dtos/recipe_step_link_dto.dart';
import 'package:hw/data/i_identical.dart';
import 'package:hw/data/repositories/recipe_repository/index.dart';

extension RecipeRepositoryRead on RecipeRepository {
  Future<List<T>> _getSourceList<T extends IIdentical>(
    Future<List<T>> Function() callbackNetwork,
    Future<List<T>> Function() callbackLocal,
    Future<void> Function(List<T> value) addLocalCallback,
  ) async {
    final localList = await callbackLocal();

    if (isOffline) {
      return localList;
    }

    try {
      final networkList = await callbackNetwork();
      await addLocalCallback(networkList);

      final allItems = <int, T>{};

      for (var item in localList) {
        if (item.id != null) allItems[item.id!] = item;
      }

      for (var item in networkList) {
        if (item.id != null) allItems[item.id!] = item;
      }

      return allItems.values.toList();
    } catch (e) {
      return localList;
    }
  }

  Future<List<RecipeDto>> getRecipes() => _getSourceList(
        datasource.getRecipes,
        localsource.getRecipes,
        localsource.initRecipes,
      );

  Future<List<RecipeStepDto>> getSteps() => _getSourceList(
        datasource.getSteps,
        localsource.getSteps,
        localsource.initSteps,
      );

  Future<List<RecipeStepLinkDto>> getStepLinks() => _getSourceList(
        datasource.getStepLinks,
        localsource.getStepLinks,
        localsource.initStepLinks,
      );

  Future<List<IngredientDto>> getIngredients() => _getSourceList(
        datasource.getIngredients,
        localsource.getIngredients,
        localsource.initIngredients,
      );

  Future<List<RecipeIngredientDto>> getRecipeIngredients() => _getSourceList(
        datasource.getRecipeIngredients,
        localsource.getRecipeIngredients,
        localsource.initRecipeIngredients,
      );

  Future<List<MeasureUnitDto>> getMeasureUnits() => _getSourceList(
        datasource.getMeasureUnits,
        localsource.getMeasureUnits,
        localsource.initMeasureUnits,
      );
}
