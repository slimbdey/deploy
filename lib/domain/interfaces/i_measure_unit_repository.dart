import 'package:hw/domain/entities/measure_unit.dart';

abstract class IMeasureUnitRepository {
  Future<List<MeasureUnit>> getList();
}
