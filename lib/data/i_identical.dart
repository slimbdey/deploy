import 'dart:math';

abstract class IIdentical {
  final int? id;

  const IIdentical({this.id});

  int getId<T>(List<T> list) {
    if (list.isEmpty) return 1;

    final maxId = list.map((e) => (e as IIdentical).id ?? 0).reduce(max);
    return maxId + 1;
  }

  IIdentical copyWith({int? id});
}
