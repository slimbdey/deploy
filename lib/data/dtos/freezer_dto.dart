import 'package:hw/data/dtos/ref_dto.dart';

class FreezerDto {
  final int id;
  final int count;
  final RefDto ingredient;

  const FreezerDto({
    required this.id,
    required this.count,
    required this.ingredient,
  });

  FreezerDto copyWith({int? id, int? count, RefDto? ingredient}) {
    return FreezerDto(
      id: id ?? this.id,
      count: count ?? this.count,
      ingredient: ingredient ?? this.ingredient,
    );
  }

  factory FreezerDto.fromJson(Map<String, dynamic> json) {
    return FreezerDto(
      id: json['id'] as int,
      count: json['count'] as int,
      ingredient: RefDto.fromJson(json['ingredient'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'count': count, 'ingredient': ingredient.toJson()};
  }
}
