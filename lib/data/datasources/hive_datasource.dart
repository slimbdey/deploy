import 'package:hive_flutter/adapters.dart';
import 'package:hw/data/datasources/i_localstorage.dart';
import 'package:hw/data/dtos/comment_dto.dart';
import 'package:hw/data/dtos/favorite_dto.dart';
import 'package:hw/data/dtos/freezer_dto.dart';
import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/data/dtos/recipe_ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/data/dtos/recipe_step_link_dto.dart';
import 'package:hw/data/i_identical.dart';

class HiveDatasource implements ILocalStorage {
  static const _foodBoxName = 'food_box';

  static const _recipeKey = 'recipe';
  static const _stepKey = 'step';
  static const _stepLinkKey = 'stepLink';
  static const _ingredientKey = 'ingredient';
  static const _recipeIngredientKey = 'recipeIngredient';
  static const _commentKey = 'comment';
  static const _favoriteKey = 'favorite';
  static const _freezerKey = 'freezer';
  static const _measureUnitKey = 'measureUnits';

  static const _recipeUnsyncedKey = 'recipeUnsynced';
  static const _stepUnsyncedKey = 'stepUnsynced';
  static const _stepLinkUnsyncedKey = 'stepLinkUnsynced';
  static const _ingredientUnsyncedKey = 'ingredientUnsynced';
  static const _recipeIngredientUnsyncedKey = 'recipeIngredientUnsynced';
  static const _commentUnsyncedKey = 'commentUnsynced';
  static const _favoriteUnsyncedKey = 'favoriteUnsynced';
  static const _measureUnitUnsyncedKey = 'measureUnitsUnsynced';

  Box? _foodBox;

  Future<void> _init() async {
    await Hive.initFlutter();
    _foodBox = await Hive.openBox(_foodBoxName);
  }

  Future<List<T>> _getList<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = _foodBox?.get(key);
      if (response == null) {
        return [];
      }

      final list = response as List;
      final dtos = list.map((item) {
        final map = Map<String, dynamic>.from(item as Map);
        return fromJson(map);
      }).toList();

      return dtos;
    } catch (e) {
      throw Exception('hive exception: $e');
    }
  }

  Future<T> _create<T extends IIdentical>(
    String unsyncedKey,
    String networkKey,
    T value,
    Map<String, dynamic> Function(T) toJson,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final unsyncedList =
          await _foodBox?.get(unsyncedKey) as List<dynamic>? ?? [];
      final networkList =
          await _getList(networkKey, fromJson) as List<dynamic>? ?? [];

      final newId = value.getId(networkList);
      final newValue = value.copyWith(id: newId) as T;
      final jsonMap = toJson(newValue);
      unsyncedList.add(jsonMap);
      await _foodBox?.put(unsyncedKey, unsyncedList);

      return newValue;
    } catch (e) {
      throw Exception('hive exception: $e');
    }
  }

  Future<void> _delete(String key, int id) async {
    try {
      final response = await _foodBox?.get(key);

      if (response == null) {
        return;
      }

      final list = response as List<dynamic>;
      final newList = list.where((item) {
        final map = item as Map;
        return map['id'] != id;
      }).toList();
      await _foodBox?.put(key, newList);
    } catch (e) {
      throw Exception('hive exception: $e');
    }
  }

  HiveDatasource() {
    _init();
  }

  @override
  Future<CommentDto> addComment(CommentDto value) => _create(
        _commentUnsyncedKey,
        _commentKey,
        value,
        (it) => it.toJson(),
        CommentDto.fromJson,
      );

  @override
  Future<FavoriteDto> addFavorite(FavoriteDto value) => _create(
        _favoriteUnsyncedKey,
        _favoriteKey,
        value,
        (it) => it.toJson(),
        FavoriteDto.fromJson,
      );

  @override
  Future<IngredientDto> addIngredient(IngredientDto value) => _create(
        _ingredientUnsyncedKey,
        _ingredientKey,
        value,
        (it) => it.toJson(),
        IngredientDto.fromJson,
      );

  @override
  Future<RecipeDto> addRecipe(RecipeDto value) => _create(
        _recipeUnsyncedKey,
        _recipeKey,
        value,
        (it) => it.toJson(),
        RecipeDto.fromJson,
      );

  @override
  Future<RecipeIngredientDto> addRecipeIngredient(RecipeIngredientDto value) =>
      _create(
        _recipeIngredientUnsyncedKey,
        _recipeIngredientKey,
        value,
        (it) => it.toJson(),
        RecipeIngredientDto.fromJson,
      );

  @override
  Future<RecipeStepDto> addStep(RecipeStepDto value) => _create(
        _stepUnsyncedKey,
        _stepKey,
        value,
        (it) => it.toJson(),
        RecipeStepDto.fromJson,
      );

  @override
  Future<RecipeStepLinkDto> addStepLink(RecipeStepLinkDto value) => _create(
        _stepLinkUnsyncedKey,
        _stepLinkKey,
        value,
        (it) => it.toJson(),
        RecipeStepLinkDto.fromJson,
      );

  @override
  Future<MeasureUnitDto> addMeasureUnit(MeasureUnitDto value) => _create(
        _measureUnitUnsyncedKey,
        _measureUnitKey,
        value,
        (it) => it.toJson(),
        MeasureUnitDto.fromJson,
      );

  @override
  Future<void> deleteFavorite(int id) => _delete(_favoriteUnsyncedKey, id);

  @override
  Future<void> deleteIngredient(int id) => _delete(_ingredientUnsyncedKey, id);

  @override
  Future<void> deleteRecipe(int id) => _delete(_recipeUnsyncedKey, id);

  @override
  Future<void> deleteRecipeIngredient(int id) =>
      _delete(_recipeIngredientUnsyncedKey, id);

  @override
  Future<void> deleteStep(int id) => _delete(_stepUnsyncedKey, id);

  @override
  Future<void> deleteStepLink(int id) => _delete(_stepLinkUnsyncedKey, id);

  @override
  Future<List<CommentDto>> getComments(int recipeId) =>
      _getList(_commentKey, CommentDto.fromJson);

  @override
  Future<List<FavoriteDto>> getFavorites() =>
      _getList(_favoriteKey, FavoriteDto.fromJson);

  @override
  Future<List<FreezerDto>> getFreezer() =>
      _getList(_freezerKey, FreezerDto.fromJson);

  @override
  Future<List<IngredientDto>> getIngredients() async {
    final ingredients = await _getList(_ingredientKey, IngredientDto.fromJson);
    final unsyncedIngredients = await _getList(
      _ingredientUnsyncedKey,
      IngredientDto.fromJson,
    );

    return [...ingredients, ...unsyncedIngredients];
  }

  @override
  Future<List<MeasureUnitDto>> getMeasureUnits() =>
      _getList(_measureUnitKey, MeasureUnitDto.fromJson);

  @override
  Future<List<RecipeIngredientDto>> getRecipeIngredients() async {
    final recipeIngredients = await _getList(
      _recipeIngredientKey,
      RecipeIngredientDto.fromJson,
    );
    final unsyncedRecipeIngredients = await _getList(
      _recipeIngredientUnsyncedKey,
      RecipeIngredientDto.fromJson,
    );

    return [...recipeIngredients, ...unsyncedRecipeIngredients];
  }

  @override
  Future<List<RecipeDto>> getRecipes() async {
    final recipes = await _getList(_recipeKey, RecipeDto.fromJson);
    final unsyncedRecipes = await _getList(
      _recipeUnsyncedKey,
      RecipeDto.fromJson,
    );

    return [...recipes, ...unsyncedRecipes];
  }

  @override
  Future<List<RecipeStepLinkDto>> getStepLinks() async {
    final stepLinks = await _getList(_stepLinkKey, RecipeStepLinkDto.fromJson);
    final unsyncedStepLinks = await _getList(
      _stepLinkUnsyncedKey,
      RecipeStepLinkDto.fromJson,
    );

    return [...stepLinks, ...unsyncedStepLinks];
  }

  @override
  Future<List<RecipeStepDto>> getSteps() async {
    final steps = await _getList(_stepKey, RecipeStepDto.fromJson);
    final unsyncedSteps = await _getList(
      _stepUnsyncedKey,
      RecipeStepDto.fromJson,
    );

    return [...steps, ...unsyncedSteps];
  }

  Future<void> _createList<T>(
    String key,
    List<T> value,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    try {
      if (_foodBox?.containsKey(key) == true) {
        await _foodBox?.delete(key);
      }

      final newItems = value.map(toJson).toList();
      await _foodBox?.put(key, newItems);
    } catch (e) {
      throw Exception('hive exception: $e');
    }
  }

  @override
  Future<void> initIngredients(List<IngredientDto> value) =>
      _createList(_ingredientKey, value, (item) => item.toJson());

  @override
  Future<void> initMeasureUnits(List<MeasureUnitDto> value) =>
      _createList(_measureUnitKey, value, (item) => item.toJson());

  @override
  Future<void> initRecipeIngredients(List<RecipeIngredientDto> value) =>
      _createList(_recipeIngredientKey, value, (item) => item.toJson());

  @override
  Future<void> initRecipes(List<RecipeDto> value) =>
      _createList(_recipeKey, value, (item) => item.toJson());

  @override
  Future<void> initStepLinks(List<RecipeStepLinkDto> value) =>
      _createList(_stepLinkKey, value, (item) => item.toJson());

  @override
  Future<void> initSteps(List<RecipeStepDto> value) =>
      _createList(_stepKey, value, (item) => item.toJson());

  @override
  Future<void> initFavorites(List<FavoriteDto> value) =>
      _createList(_favoriteKey, value, (item) => item.toJson());

  @override
  Future<void> initComments(List<CommentDto> value) =>
      _createList(_commentKey, value, (item) => item.toJson());

  @override
  Future<List<CommentDto>> getUnsyncedComments() =>
      _getList(_commentUnsyncedKey, CommentDto.fromJson);

  @override
  Future<List<FavoriteDto>> getUnsyncedFavorites() =>
      _getList(_favoriteUnsyncedKey, FavoriteDto.fromJson);

  @override
  Future<List<IngredientDto>> getUnsyncedIngredients() =>
      _getList(_ingredientUnsyncedKey, IngredientDto.fromJson);

  @override
  Future<List<MeasureUnitDto>> getUnsyncedMeasureUnits() =>
      _getList(_measureUnitUnsyncedKey, MeasureUnitDto.fromJson);

  @override
  Future<List<RecipeIngredientDto>> getUnsyncedRecipeIngredients() =>
      _getList(_recipeIngredientUnsyncedKey, RecipeIngredientDto.fromJson);

  @override
  Future<List<RecipeDto>> getUnsyncedRecipes() =>
      _getList(_recipeUnsyncedKey, RecipeDto.fromJson);

  @override
  Future<List<RecipeStepLinkDto>> getUnsyncedStepLinks() =>
      _getList(_stepLinkUnsyncedKey, RecipeStepLinkDto.fromJson);

  @override
  Future<List<RecipeStepDto>> getUnsyncedSteps() =>
      _getList(_stepUnsyncedKey, RecipeStepDto.fromJson);

  @override
  Future<void> clear() async {
    _foodBox?.clear();
  }

  @override
  Future<List<dynamic>?> getContents() async {
    return _foodBox?.keys.toList();
  }
}
