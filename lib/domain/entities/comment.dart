class Comment {
  final int id;
  final String text;
  final String photo;
  final String datetime;
  final int recipeId;

  const Comment({
    required this.id,
    required this.text,
    required this.photo,
    required this.datetime,
    required this.recipeId,
  });
}
