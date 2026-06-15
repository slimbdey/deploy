import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/data/dtos/recipe_ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/data/dtos/recipe_step_link_dto.dart';
import 'package:hw/data/dtos/ref_dto.dart';
import 'package:hw/data/mappers/ingredient_mapper.dart';
import 'package:hw/data/mappers/recipe_mapper.dart';
import 'package:hw/data/mappers/step_mapper.dart';
import 'package:hw/data/repositories/recipe_repository/index.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';
import 'package:hw/domain/entities/recipe_step_link.dart';

extension RecipeRepositoryExtensions on RecipeRepository {
  Recipe assembleRecipe(
    RecipeDto dto,
    List<RecipeStepDto> stepDtos,
    List<RecipeStepLinkDto> stepLinkDtos,
    List<IngredientDto> ingredientDtos,
    List<RecipeIngredientDto> recipeIngredientDtos,
    List<MeasureUnitDto> measureUnitDtos,
  ) {
    final dtoStepLinks = stepLinkDtos
        .where((sl) => sl.recipe.id == dto.id)
        .toList()
      ..sort((a, b) => a.number.compareTo(b.number));

    final stepLinks = dtoStepLinks.map((dsl) {
      final stepDto = stepDtos.firstWhere((s) => s.id == dsl.step.id);

      return RecipeStepLink(
        id: dsl.id as int,
        number: dsl.number,
        step: StepMapper.mapDtoToEntity(stepDto),
      );
    }).toList();

    final dtoRecipeIngredients =
        recipeIngredientDtos.where((ri) => ri.recipe.id == dto.id).toList();

    final recipeIngredients = dtoRecipeIngredients.map((dri) {
      final ingredientDto = ingredientDtos.firstWhere(
        (i) => i.id == dri.ingredient.id,
      );

      return RecipeIngredient(
        id: dri.id as int,
        count: dri.count,
        ingredient: IngredientMapper.mapDtoToEntity(
          ingredientDto,
          measureUnitDtos,
        ),
      );
    }).toList();

    return RecipeMapper.mapDtoToEntity(dto, stepLinks, recipeIngredients);
  }

  List<RecipeStepDto> assembleStepDtos(Recipe value) => value.recipeSteps
      .map(
        (rsl) => RecipeStepDto(
          id: null,
          name: rsl.step.content,
          duration: rsl.step.duration,
        ),
      )
      .toList();

  List<RecipeStepLinkDto> assembleStepLinkDtos(
    Recipe value,
    List<RecipeStepDto> stepResponses,
    int recipeId,
  ) =>
      value.recipeSteps
          .asMap()
          .entries
          .map(
            (rsl) => RecipeStepLinkDto(
              id: null,
              number: rsl.value.number,
              step: RefDto(id: stepResponses[rsl.key].id ?? 0),
              recipe: RefDto(id: recipeId),
            ),
          )
          .toList();

  List<IngredientDto> assembleIngredientDtos(Recipe value) =>
      value.recipeIngredients
          .map(
            (rsi) => IngredientDto(
              caloriesForUnit: rsi.ingredient.caloriesForUnit.toDouble(),
              id: null,
              measureUnit: RefDto(id: 1),
              name: rsi.ingredient.name,
            ),
          )
          .toList();

  List<RecipeIngredientDto> assembleRecipeIngredientDtos(
    Recipe value,
    List<IngredientDto> ingredientResponses,
    int recipeId,
  ) =>
      value.recipeIngredients
          .asMap()
          .entries
          .map(
            (rsi) => RecipeIngredientDto(
              id: null,
              count: rsi.value.count,
              ingredient: RefDto(id: ingredientResponses[rsi.key].id ?? 0),
              recipe: RefDto(id: recipeId),
            ),
          )
          .toList();
}
