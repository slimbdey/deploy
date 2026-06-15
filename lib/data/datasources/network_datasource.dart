import 'package:hw/core/dio_client.dart';
import 'package:hw/data/datasources/i_datasource.dart';
import 'package:hw/data/dtos/comment_dto.dart';
import 'package:hw/data/dtos/favorite_dto.dart';
import 'package:hw/data/dtos/freezer_dto.dart';
import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/data/dtos/recipe_ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/data/dtos/recipe_step_link_dto.dart';

class NetworkDataSource extends IDatasource {
  final DioClient client = DioClient();

  NetworkDataSource();

  @override
  Future<List<FavoriteDto>> getFavorites() =>
      client.getList<FavoriteDto>('favorite', FavoriteDto.fromJson);

  @override
  Future<FavoriteDto> addFavorite(FavoriteDto value) =>
      client.create<FavoriteDto>(
        'favorite',
        value,
        (item) => item.toJson(),
        FavoriteDto.fromJson,
      );

  @override
  Future<void> deleteFavorite(int id) => client.delete('favorite', id);

  @override
  Future<List<CommentDto>> getComments(int recipeId) async {
    final list = await client.getList<CommentDto>(
      'comment',
      CommentDto.fromJson,
    );
    return list.where((c) => c.recipe.id == recipeId).toList();
  }

  @override
  Future<CommentDto> addComment(CommentDto value) => client.create<CommentDto>(
        'comment',
        value,
        (item) => item.toJson(),
        CommentDto.fromJson,
      );

  @override
  Future<List<FreezerDto>> getFreezer() =>
      client.getList<FreezerDto>('freezer', FreezerDto.fromJson);

  @override
  Future<List<MeasureUnitDto>> getMeasureUnits() =>
      client.getList<MeasureUnitDto>('measure_unit', MeasureUnitDto.fromJson);

  @override
  Future<MeasureUnitDto> addMeasureUnit(MeasureUnitDto value) =>
      client.create<MeasureUnitDto>(
        'measure_unit',
        value,
        (item) => item.toJson(),
        MeasureUnitDto.fromJson,
      );

  @override
  Future<List<RecipeDto>> getRecipes() =>
      client.getList<RecipeDto>('recipe', RecipeDto.fromJson);

  @override
  Future<RecipeDto> addRecipe(RecipeDto value) => client.create<RecipeDto>(
        'recipe',
        value,
        (item) => item.toJson(),
        RecipeDto.fromJson,
      );

  @override
  Future<void> deleteRecipe(int id) => client.delete('recipe', id);

  @override
  Future<List<RecipeStepDto>> getSteps() =>
      client.getList<RecipeStepDto>('recipe_step', RecipeStepDto.fromJson);

  @override
  Future<RecipeStepDto> addStep(RecipeStepDto value) =>
      client.create<RecipeStepDto>(
        'recipe_step',
        value,
        (item) => item.toJson(),
        RecipeStepDto.fromJson,
      );

  @override
  Future<void> deleteStep(int id) => client.delete('recipe_step', id);

  @override
  Future<List<RecipeStepLinkDto>> getStepLinks() =>
      client.getList<RecipeStepLinkDto>(
        'recipe_step_link',
        RecipeStepLinkDto.fromJson,
      );

  @override
  Future<RecipeStepLinkDto> addStepLink(RecipeStepLinkDto value) =>
      client.create<RecipeStepLinkDto>(
        'recipe_step_link',
        value,
        (item) => item.toJson(),
        RecipeStepLinkDto.fromJson,
      );

  @override
  Future<void> deleteStepLink(int id) => client.delete('recipe_step_link', id);

  @override
  Future<List<IngredientDto>> getIngredients() =>
      client.getList<IngredientDto>('ingredient', IngredientDto.fromJson);

  @override
  Future<IngredientDto> addIngredient(IngredientDto value) =>
      client.create<IngredientDto>(
        'ingredient',
        value,
        (item) => item.toJson(),
        IngredientDto.fromJson,
      );

  @override
  Future<void> deleteIngredient(int id) => client.delete('ingredient', id);

  @override
  Future<List<RecipeIngredientDto>> getRecipeIngredients() =>
      client.getList<RecipeIngredientDto>(
        'recipe_ingredient',
        RecipeIngredientDto.fromJson,
      );

  @override
  Future<RecipeIngredientDto> addRecipeIngredient(RecipeIngredientDto value) =>
      client.create<RecipeIngredientDto>(
        'recipe_ingredient',
        value,
        (item) => item.toJson(),
        RecipeIngredientDto.fromJson,
      );

  @override
  Future<void> deleteRecipeIngredient(int id) =>
      client.delete('recipe_ingredient', id);
}
