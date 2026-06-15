import 'package:hw/domain/entities/recipe.dart';

abstract class IRecipeRepository {
  Future<List<Recipe>> getList();
  Future<Recipe> create(Recipe value);
  Future<void> clearHive();
  Future<List<dynamic>?> getHiveContents();
}
