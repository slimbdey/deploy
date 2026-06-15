class RefDto {
  final int id;
  const RefDto({required this.id});

  factory RefDto.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return RefDto(id: 0);
    }

    return RefDto(id: json['id'] as int? ?? 0);
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
