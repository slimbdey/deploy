import 'package:hw/data/i_identical.dart';

class MeasureUnitDto extends IIdentical {
  final String one;
  final String few;
  final String many;

  const MeasureUnitDto({
    super.id,
    required this.one,
    required this.few,
    required this.many,
  });

  @override
  MeasureUnitDto copyWith({int? id, String? one, String? few, String? many}) {
    return MeasureUnitDto(
      id: id == -1 ? this.id : id,
      one: one ?? this.one,
      few: few ?? this.few,
      many: many ?? this.many,
    );
  }

  factory MeasureUnitDto.fromJson(Map<String, dynamic> json) {
    return MeasureUnitDto(
      id: json['id'] as int,
      one: json['one'] as String,
      few: json['few'] as String,
      many: json['many'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'one': one, 'few': few, 'many': many};
  }
}
