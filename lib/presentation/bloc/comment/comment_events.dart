import 'package:hw/domain/entities/comment.dart';

abstract class CommentEvent {
  const CommentEvent();
}

class CommentsLoadedEvent extends CommentEvent {
  const CommentsLoadedEvent();
}

class CommentsLoadEvent extends CommentEvent {
  final int recipeId;

  const CommentsLoadEvent({required this.recipeId});
}

class CommentsAddEvent extends CommentEvent {
  final Comment comment;

  const CommentsAddEvent(this.comment);
}
