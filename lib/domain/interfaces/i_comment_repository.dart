import 'package:hw/domain/entities/comment.dart';

abstract class ICommentRepository {
  Future<List<Comment>> getList(int recipeId);
  Future<Comment> create(Comment value);
}
