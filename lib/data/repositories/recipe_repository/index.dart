import 'package:hw/data/datasources/i_datasource.dart';
import 'package:hw/data/datasources/i_localstorage.dart';
import 'package:hw/data/mappers/recipe_mapper.dart';
import 'package:hw/data/repositories/recipe_repository/recipe_repository.create.dart';
import 'package:hw/data/repositories/recipe_repository/recipe_repository.extensions.dart';
import 'package:hw/data/repositories/network_checker.dart';
import 'package:hw/data/repositories/recipe_repository/recipe_repository.read.dart';
import 'package:hw/data/repositories/recipe_repository/recipe_repository.sync.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/domain/interfaces/i_recipe_repository.dart';

class RecipeRepository extends NetworkChecker implements IRecipeRepository {
  final IDatasource datasource;
  final ILocalStorage localsource;

  RecipeRepository({required this.datasource, required this.localsource});

  @override
  Future<List<Recipe>> getList() async {
    await syncBackground();

    final dtos = await getRecipes();
    final stepDtos = await getSteps();
    final stepLinkDtos = await getStepLinks();
    final ingredientDtos = await getIngredients();
    final recipeIngredientDtos = await getRecipeIngredients();
    final measureUnitDtos = await getMeasureUnits();

    return dtos
        .map(
          (dto) => assembleRecipe(
            dto,
            stepDtos,
            stepLinkDtos,
            ingredientDtos,
            recipeIngredientDtos,
            measureUnitDtos,
          ),
        )
        .toList();
  }

  @override
  Future<Recipe> create(Recipe value) async {
    final valueDto = RecipeMapper.mapEntityToDto(value);

    final recipeResponse = await createRecipe(valueDto);

    final stepDtos = assembleStepDtos(value);
    final stepResponses = await Future.wait(stepDtos.map(createStep));

    final stepLinks = assembleStepLinkDtos(
      value,
      stepResponses,
      recipeResponse.id ?? 0,
    );
    await Future.wait(stepLinks.map(createStepLink));

    final ingredientDtos = assembleIngredientDtos(value);
    final ingredientResponses = await Future.wait(
      ingredientDtos.map(createIngredient),
    );

    final recipeIngredients = assembleRecipeIngredientDtos(
      value,
      ingredientResponses,
      recipeResponse.id ?? 0,
    );
    await Future.wait(recipeIngredients.map(createRecipeIngredient));

    final newValue = value.copyWith(id: recipeResponse.id);
    return newValue;
  }

  @override
  Future<void> clearHive() => localsource.clear();

  @override
  Future<List<dynamic>?> getHiveContents() => localsource.getContents();
}
