class Favorite {
  final int id;
  final int recipeId;

  const Favorite({required this.id, required this.recipeId});

  Favorite copyWith({
    int? id,
    int? recipeId,
  }) {
    return Favorite(
      id: id ?? this.id,
      recipeId: recipeId ?? this.recipeId,
    );
  }
}
