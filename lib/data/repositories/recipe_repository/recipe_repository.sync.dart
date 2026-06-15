import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/data/dtos/recipe_ingredient_dto.dart';
import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/data/dtos/recipe_step_link_dto.dart';
import 'package:hw/data/repositories/recipe_repository/index.dart';

extension RecipeRepositorySync on RecipeRepository {
  Future<void> syncBackground() async {
    if (isOffline) {
      return;
    }

    final unsyncedList = await Future.wait([
      localsource.getUnsyncedRecipes(),
      localsource.getUnsyncedSteps(),
      localsource.getUnsyncedStepLinks(),
      localsource.getUnsyncedIngredients(),
      localsource.getUnsyncedRecipeIngredients(),
    ]);

    final unsynced = unsyncedList.expand((it) => it).toList();

    for (var it in unsynced) {
      try {
        if (it is RecipeDto) {
          await datasource.addRecipe(it);
          await localsource.deleteRecipe(it.id ?? 0);
        }

        if (it is RecipeStepDto) {
          await datasource.addStep(it);
          await localsource.deleteStep(it.id ?? 0);
        }

        if (it is RecipeStepLinkDto) {
          await datasource.addStepLink(it);
          await localsource.deleteStepLink(it.id ?? 0);
        }

        if (it is IngredientDto) {
          await datasource.addIngredient(it);
          await localsource.deleteIngredient(it.id ?? 0);
        }

        if (it is RecipeIngredientDto) {
          await datasource.addRecipeIngredient(it);
          await localsource.deleteRecipeIngredient(it.id ?? 0);
        }
      } catch (_) {
        break;
      }
    }
  }
}
