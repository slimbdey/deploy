import 'package:hw/data/i_identical.dart';

class RecipeDto extends IIdentical {
  final String name;
  int duration;
  final String photo;

  RecipeDto({
    super.id,
    required this.name,
    required this.duration,
    required this.photo,
  });

  @override
  RecipeDto copyWith({int? id, String? name, int? duration, String? photo}) {
    return RecipeDto(
      id: id == -1 ? this.id : id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      photo: photo ?? this.photo,
    );
  }

  factory RecipeDto.fromJson(Map<String, dynamic> json) {
    return RecipeDto(
      id: json['id'] as int?,
      name: json['name'] as String,
      duration: json['duration'] as int,
      photo: json['photo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {'id': id, 'name': name, 'duration': duration, 'photo': photo};
    }

    return {'name': name, 'duration': duration, 'photo': photo};
  }
}
