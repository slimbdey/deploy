import 'package:hw/data/dtos/ingredient_dto.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/dtos/ref_dto.dart';
import 'package:hw/data/mappers/measure_unit_mapper.dart';
import 'package:hw/domain/entities/ingredient.dart';

class IngredientMapper {
  static Ingredient mapDtoToEntity(
    IngredientDto dto,
    List<MeasureUnitDto> measureUnits,
  ) {
    final measureUnitDto = measureUnits.firstWhere(
      (mu) => dto.measureUnit.id == mu.id,
    );

    return Ingredient(
      id: dto.id ?? 0,
      name: dto.name,
      caloriesForUnit: dto.caloriesForUnit.toInt(),
      measureUnit: MeasureUnitMapper.mapDtoToEntity(measureUnitDto),
    );
  }

  static IngredientDto mapEntityToDto(Ingredient entity) {
    return IngredientDto(
      id: entity.id == 0 ? null : entity.id,
      name: entity.name,
      caloriesForUnit: entity.caloriesForUnit.toDouble(),
      measureUnit: RefDto(id: entity.measureUnit.id),
    );
  }
}
