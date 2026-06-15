import 'package:hw/data/dtos/ref_dto.dart';
import 'package:hw/data/i_identical.dart';

class CommentDto extends IIdentical {
  final String text;
  final String photo;
  final String datetime;
  final RefDto recipe;

  const CommentDto({
    super.id,
    required this.text,
    required this.photo,
    required this.datetime,
    required this.recipe,
  });

  factory CommentDto.fromJson(Map<String, dynamic> json) {
    return CommentDto(
      id: json['id'] as int?,
      text: json['text'] as String,
      photo: json['photo'] ?? '',
      datetime: json['datetime'] as String,
      recipe: RefDto.fromJson(json['recipe']),
    );
  }

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {
        'id': id,
        'text': text,
        'photo': photo,
        'datetime': datetime,
        'recipe': recipe.toJson(),
      };
    }

    return {
      'text': text,
      'photo': photo,
      'datetime': datetime,
      'recipe': recipe.toJson(),
    };
  }

  @override
  CommentDto copyWith({
    int? id,
    String? text,
    String? photo,
    String? datetime,
    RefDto? recipe,
  }) {
    return CommentDto(
      id: id ?? this.id,
      text: text ?? this.text,
      photo: photo ?? this.photo,
      datetime: datetime ?? this.datetime,
      recipe: recipe ?? this.recipe,
    );
  }
}
