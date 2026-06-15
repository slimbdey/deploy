import 'package:hw/data/dtos/ref_dto.dart';

class Freezer {
  final int id;
  final int count;
  final RefDto ingredient;

  const Freezer({
    required this.id,
    required this.count,
    required this.ingredient,
  });

  Freezer copyWith({int? id, int? count, RefDto? ingredient}) {
    return Freezer(
      id: id ?? this.id,
      count: count ?? this.count,
      ingredient: ingredient ?? this.ingredient,
    );
  }

  factory Freezer.fromJson(Map<String, dynamic> json) {
    return Freezer(
      id: json['id'] as int,
      count: json['count'] as int,
      ingredient: RefDto.fromJson(json['ingredient'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'count': count, 'ingredient': ingredient.toJson()};
  }
}
