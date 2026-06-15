import 'dart:math';

import 'package:hw/data/datasources/i_datasource.dart';
import 'package:hw/data/datasources/mock/mock_ingredients.dart';
import 'package:hw/data/datasources/mock/mock_measure_units.dart';
import 'package:hw/data/dtos/comment_dto.dart';
import 'package:hw/data/dtos/favorite_dto.dart';
import 'package:hw/data/dtos/freezer_dto.dart';
import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/data/dtos/recipe_ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/data/dtos/recipe_step_link_dto.dart';
import 'package:hw/data/dtos/ref_dto.dart';

import 'mock_recipes.dart';
import 'mock_steps.dart';

final random = Random();
const delay = Duration(milliseconds: 200);
Future<T> delayWrapper<T>(T Function() callback) =>
    Future.delayed(delay, callback);

class MockDatasource implements IDatasource {
  late final List<RecipeDto> _recipes;
  late final List<RecipeStepDto> _steps;
  late final List<RecipeStepLinkDto> _stepLinks;
  late final List<MeasureUnitDto> _measureUnits;
  late final List<IngredientDto> _ingredients;
  late final List<RecipeIngredientDto> _recipeIngredients;
  late final List<FavoriteDto> _favorites;
  late final List<CommentDto> _comments;

  MockDatasource() {
    _measureUnits = mockMeasureUnits();
    _ingredients = mockIngredients();
    _favorites = [];
    _comments = [];
    _recipes = mockRecipes();
    _steps = mockSteps();
    _stepLinks =
        _recipes.expand((r) => _assembleRecipeStepLinks(r.id ?? 0)).toList();
    _recipeIngredients =
        _recipes.expand((r) => _assembleRecipeIngredients(r.id ?? 0)).toList();
  }

  @override
  Future<List<FreezerDto>> getFreezer() => delayWrapper(
        () => List.generate(
          _ingredients.length,
          (index) => FreezerDto(
            id: random.nextInt(500),
            count: random.nextInt(500),
            ingredient: RefDto(id: _ingredients[index].id ?? 0),
          ),
        ),
      );

  @override
  Future<List<RecipeDto>> getRecipes() => delayWrapper(() => _recipes);

  @override
  Future<RecipeDto> addRecipe(RecipeDto value) async {
    final recipe = value.copyWith(id: _recipes.length);
    _recipes.add(recipe);
    return recipe;
  }

  @override
  Future<void> deleteRecipe(int id) async {
    _recipes.removeWhere((r) => r.id == id);
  }

  @override
  Future<List<MeasureUnitDto>> getMeasureUnits() =>
      delayWrapper(() => _measureUnits);

  @override
  Future<FavoriteDto> addFavorite(FavoriteDto value) async {
    final favoriteIds = _favorites.map((f) => f.id ?? 0).toList();
    final maxId =
        favoriteIds.isEmpty ? 0 : favoriteIds.reduce((a, b) => a > b ? a : b);
    final favorite = value.copyWith(id: maxId + 1);
    _favorites.add(favorite);
    return favorite;
  }

  @override
  Future<void> deleteFavorite(int id) async {
    _favorites.removeWhere((it) => it.id == id);
  }

  @override
  Future<List<FavoriteDto>> getFavorites() => Future.value(_favorites);

  @override
  Future<CommentDto> addComment(CommentDto value) async {
    final comment = value.copyWith(id: _comments.length);
    _comments.add(comment);
    return comment;
  }

  @override
  Future<List<CommentDto>> getComments(int recipeId) =>
      Future.value(_comments.where((c) => c.recipe.id == recipeId).toList());

  @override
  Future<List<RecipeStepDto>> getSteps() => Future.value(_steps);

  @override
  Future<RecipeStepDto> addStep(RecipeStepDto value) async {
    final newStep = value.copyWith(id: _steps.length);
    _steps.add(newStep);
    return newStep;
  }

  @override
  Future<void> deleteStep(int id) async {
    _steps.removeWhere((s) => s.id == id);
  }

  @override
  Future<List<RecipeStepLinkDto>> getStepLinks() => Future.value(_stepLinks);

  @override
  Future<RecipeStepLinkDto> addStepLink(RecipeStepLinkDto dto) async {
    final newDto = dto.copyWith(id: _stepLinks.length);
    _stepLinks.add(newDto);
    return newDto;
  }

  @override
  Future<void> deleteStepLink(int id) async {
    _stepLinks.removeWhere((s) => s.id == id);
  }

  @override
  Future<List<IngredientDto>> getIngredients() =>
      delayWrapper(() => _ingredients);

  @override
  Future<IngredientDto> addIngredient(IngredientDto value) async {
    final newDto = value.copyWith(id: _ingredients.length);
    _ingredients.add(newDto);
    return newDto;
  }

  @override
  Future<void> deleteIngredient(int id) async {
    _ingredients.removeWhere((i) => i.id == id);
  }

  @override
  Future<List<RecipeIngredientDto>> getRecipeIngredients() =>
      delayWrapper(() => _recipeIngredients);

  @override
  Future<RecipeIngredientDto> addRecipeIngredient(
    RecipeIngredientDto value,
  ) async {
    final newDto = value.copyWith(id: _recipeIngredients.length);
    _recipeIngredients.add(newDto);
    return newDto;
  }

  @override
  Future<void> deleteRecipeIngredient(int id) async {
    _recipeIngredients.removeWhere((ri) => ri.id == id);
  }

  List<RecipeStepLinkDto> _assembleRecipeStepLinks(int recipeId) {
    final recipeStepLinksCount = random.nextInt(5) + 2;
    final shuffeledSteps = [..._steps]..shuffle(random);

    return List.generate(
      recipeStepLinksCount,
      (index) => RecipeStepLinkDto(
        id: random.nextInt(1024) + 1,
        number: index,
        step: RefDto(id: shuffeledSteps[index].id ?? 0),
        recipe: RefDto(id: recipeId),
      ),
    );
  }

  List<RecipeIngredientDto> _assembleRecipeIngredients(int recipeId) {
    final ingredientsCount = random.nextInt(5) + 2;
    final shuffeledIngredients = [..._ingredients]..shuffle(random);

    return List.generate(
      ingredientsCount,
      (index) => RecipeIngredientDto(
        id: random.nextInt(1024) + 1,
        count: random.nextInt(51) + 5,
        ingredient: RefDto(id: shuffeledIngredients[index].id ?? 0),
        recipe: RefDto(id: recipeId),
      ),
    );
  }

  @override
  Future<MeasureUnitDto> addMeasureUnit(MeasureUnitDto value) async {
    final newDto = value.copyWith(id: _measureUnits.length);
    _measureUnits.add(value);
    return newDto;
  }
}
