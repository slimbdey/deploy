import 'package:hw/data/dtos/favorite_dto.dart';
import 'package:hw/data/dtos/ref_dto.dart';
import 'package:hw/domain/entities/favorite.dart';

class FavoriteMapper {
  static Favorite mapDtoToEntity(FavoriteDto dto) {
    return Favorite(id: dto.id ?? 0, recipeId: dto.recipe.id);
  }

  static FavoriteDto mapEntityToDto(Favorite entity) {
    return FavoriteDto(
      id: entity.id == 0 ? null : entity.id,
      recipe: RefDto(id: entity.recipeId),
      user: RefDto(id: 1),
    );
  }
}
