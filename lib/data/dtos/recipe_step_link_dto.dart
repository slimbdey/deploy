import 'package:hw/data/i_identical.dart';

import 'ref_dto.dart';

class RecipeStepLinkDto extends IIdentical {
  final int number;
  final RefDto step;
  final RefDto recipe;

  RecipeStepLinkDto({
    super.id,
    required this.number,
    required this.step,
    required this.recipe,
  });

  factory RecipeStepLinkDto.fromJson(Map<String, dynamic> json) {
    return RecipeStepLinkDto(
      id: json['id'] as int?,
      number: json['number'] as int,
      step: RefDto.fromJson(json['step']),
      recipe: RefDto.fromJson(json['recipe']),
    );
  }

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        'id': id,
        'number': number,
        'step': step.toJson(),
        'recipe': recipe.toJson(),
      };
    }

    return {'number': number, 'step': step.toJson(), 'recipe': recipe.toJson()};
  }

  @override
  RecipeStepLinkDto copyWith({
    int? id,
    int? number,
    RefDto? step,
    RefDto? recipe,
  }) {
    return RecipeStepLinkDto(
      id: id ?? this.id,
      number: number ?? this.number,
      step: step ?? this.step,
      recipe: recipe ?? this.recipe,
    );
  }
}
