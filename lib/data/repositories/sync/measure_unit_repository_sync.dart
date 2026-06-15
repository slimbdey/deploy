import 'package:hw/data/datasources/mock/mock_measure_units.dart';
import 'package:hw/data/dtos/measure_unit_dto.dart';
import 'package:hw/data/repositories/measure_unit_repository.dart';

extension MeasureUnitRepositorySync on MeasureUnitRepository {
  Future<void> syncBackground() async {
    // implement syncing
  }

  Future<List<MeasureUnitDto>> getMeasureUnits() async {
    return mockMeasureUnits();
  }
}
