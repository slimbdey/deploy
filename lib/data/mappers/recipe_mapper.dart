import 'package:hw/data/dtos/recipe_dto.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';
import 'package:hw/domain/entities/recipe_step_link.dart';

class RecipeMapper {
  static Recipe mapDtoToEntity(
    RecipeDto dto,
    List<RecipeStepLink> stepLinks,
    List<RecipeIngredient> recipeIngredients,
  ) {
    return Recipe(
      id: dto.id ?? -1,
      name: dto.name,
      duration: dto.duration,
      photo: dto.photo,
      recipeIngredients: recipeIngredients,
      recipeSteps: stepLinks,
    );
  }

  static RecipeDto mapEntityToDto(Recipe entity) {
    return RecipeDto(
      id: entity.id == -1 ? null : entity.id,
      name: entity.name,
      duration: entity.duration,
      photo: entity.photo,
    );
  }
}
