import 'package:hw/data/dtos/ref_dto.dart';
import 'package:hw/data/i_identical.dart';

class IngredientDto extends IIdentical {
  final String name;
  final double caloriesForUnit;
  final RefDto measureUnit;

  IngredientDto({
    super.id,
    required this.name,
    required this.caloriesForUnit,
    required this.measureUnit,
  });

  factory IngredientDto.fromJson(Map<String, dynamic> json) {
    return IngredientDto(
      id: json['id'] as int?,
      caloriesForUnit: json['caloriesForUnit'] as double,
      measureUnit: RefDto.fromJson(json['measureUnit']),
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        'id': id,
        'name': name,
        'caloriesForUnit': caloriesForUnit,
        'measureUnit': measureUnit.toJson(),
      };
    }

    return {
      'name': name,
      'caloriesForUnit': caloriesForUnit,
      'measureUnit': measureUnit.toJson(),
    };
  }

  @override
  IngredientDto copyWith({
    int? id,
    String? name,
    double? caloriesForUnit,
    RefDto? measureUnit,
  }) {
    return IngredientDto(
      id: id == -1 ? this.id : id,
      name: name ?? this.name,
      caloriesForUnit: caloriesForUnit ?? this.caloriesForUnit,
      measureUnit: measureUnit ?? this.measureUnit,
    );
  }
}
