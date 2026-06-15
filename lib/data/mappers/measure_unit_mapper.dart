import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/domain/entities/measure_unit.dart';

class MeasureUnitMapper {
  static MeasureUnit mapDtoToEntity(MeasureUnitDto dto) {
    return MeasureUnit(
      id: dto.id ?? 0,
      few: dto.few,
      many: dto.many,
      one: dto.one,
    );
  }

  static MeasureUnitDto mapEntityToDto(MeasureUnit entity) {
    return MeasureUnitDto(
      id: entity.id,
      few: entity.few,
      many: entity.many,
      one: entity.one,
    );
  }
}
