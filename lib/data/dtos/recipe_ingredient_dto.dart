import 'package:hw/data/dtos/ref_dto.dart';
import 'package:hw/data/i_identical.dart';

class RecipeIngredientDto extends IIdentical {
  final int count;
  final RefDto ingredient;
  final RefDto recipe;

  RecipeIngredientDto({
    super.id,
    required this.count,
    required this.ingredient,
    required this.recipe,
  });

  factory RecipeIngredientDto.fromJson(Map<String, dynamic> json) {
    return RecipeIngredientDto(
      id: json['id'] as int?,
      count: json['count'] as int,
      ingredient: RefDto.fromJson(json['ingredient']),
      recipe: RefDto.fromJson(json['recipe']),
    );
  }

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        'id': id,
        'count': count,
        'ingredient': ingredient.toJson(),
        'recipe': recipe.toJson(),
      };
    }

    return {
      'count': count,
      'ingredient': ingredient.toJson(),
      'recipe': recipe.toJson(),
    };
  }

  @override
  RecipeIngredientDto copyWith({
    int? id,
    int? count,
    RefDto? ingredient,
    RefDto? recipe,
  }) {
    return RecipeIngredientDto(
      id: id == -1 ? this.id : id,
      count: count ?? this.count,
      ingredient: ingredient ?? this.ingredient,
      recipe: recipe ?? this.recipe,
    );
  }
}
