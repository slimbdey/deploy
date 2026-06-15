import 'package:hw/data/dtos/comment_dto.dart';
import 'package:hw/data/dtos/ref_dto.dart';
import 'package:hw/domain/entities/comment.dart';

class CommentMapper {
  static Comment mapDtoToEntity(CommentDto dto) {
    return Comment(
      id: dto.id ?? 0,
      text: dto.text,
      photo: dto.photo,
      datetime: dto.datetime,
      recipeId: dto.recipe.id,
    );
  }

  static CommentDto mapEntityToDto(Comment entity) {
    return CommentDto(
      id: entity.id == 0 ? null : entity.id,
      text: entity.text,
      photo: entity.photo,
      datetime: entity.datetime,
      recipe: RefDto(id: entity.recipeId),
    );
  }
}
