import 'package:hw/data/dtos/ref_dto.dart';
import 'package:hw/data/i_identical.dart';

class FavoriteDto extends IIdentical {
  final RefDto recipe;
  final RefDto user;

  const FavoriteDto({super.id, required this.recipe, required this.user});

  factory FavoriteDto.fromJson(Map<String, dynamic> json) {
    return FavoriteDto(
      id: json['id'] as int?,
      recipe: RefDto.fromJson(json['recipe']),
      user: RefDto.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {'id': id, 'recipe': recipe.toJson(), 'user': user.toJson()};
    }

    return {'recipe': recipe.toJson(), 'user': user.toJson()};
  }

  @override
  FavoriteDto copyWith({int? id, int? recipeId, int? userId}) {
    return FavoriteDto(
      id: id ?? this.id,
      recipe: RefDto(id: recipeId ?? recipe.id),
      user: RefDto(id: userId ?? user.id),
    );
  }
}
