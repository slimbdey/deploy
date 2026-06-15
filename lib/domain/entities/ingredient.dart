import 'package:hw/domain/entities/measure_unit.dart';

class Ingredient {
  final int id;
  final String name;
  final int caloriesForUnit;
  final MeasureUnit measureUnit;

  const Ingredient({
    required this.id,
    required this.name,
    required this.caloriesForUnit,
    required this.measureUnit,
  });
}
