import 'package:hw/data/dtos/measure_unit_dto.dart';

List<MeasureUnitDto> mockMeasureUnits() => [
      MeasureUnitDto(id: 0, one: 'грамм', few: 'граммов', many: 'граммов'),
      MeasureUnitDto(id: 1, one: 'мл', few: 'мл', many: 'мл'),
      MeasureUnitDto(
          id: 2, one: 'ст. ложка', few: 'ст. ложки', many: 'ст. ложек'),
      MeasureUnitDto(id: 3, one: 'ч. ложка', few: 'ч. ложек', many: 'ч. ложек'),
      MeasureUnitDto(id: 4, one: 'шт.', few: 'шт.', many: 'шт.'),
    ];
