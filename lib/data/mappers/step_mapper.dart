import 'package:hw/data/dtos/recipe_step_dto.dart';
import 'package:hw/domain/entities/recipe_step.dart';

class StepMapper {
  static RecipeStep mapDtoToEntity(RecipeStepDto dto) {
    return RecipeStep(
      id: dto.id ?? 0,
      content: dto.name,
      duration: dto.duration,
    );
  }

  static RecipeStepDto mapEntityToDto(RecipeStep entity) {
    return RecipeStepDto(
      id: entity.id == 0 ? null : entity.id,
      name: entity.content,
      duration: entity.duration,
    );
  }
}
