import 'package:hw/data/i_identical.dart';

class RecipeStepDto extends IIdentical {
  final String name;
  final int duration;

  RecipeStepDto({super.id, required this.name, required this.duration});

  factory RecipeStepDto.fromJson(Map<String, dynamic> json) => RecipeStepDto(
        id: json['id'] as int?,
        name: json['name'] as String,
        duration: json['duration'] ?? 0,
      );

  Map<String, dynamic> toJson() {
    if (id != null) {
      return {'id': id, 'name': name, 'duration': duration};
    }

    return {'name': name, 'duration': duration};
  }

  @override
  RecipeStepDto copyWith({int? id, String? name, int? duration}) {
    return RecipeStepDto(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
    );
  }
}
