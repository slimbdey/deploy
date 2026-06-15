import 'package:hw/domain/entities/comment.dart';

abstract class CommentState {
  const CommentState();
}

class CommentInitialState extends CommentState {
  const CommentInitialState();
}

class CommentLoadingState extends CommentState {
  const CommentLoadingState();
}

class CommentsLoadedState extends CommentState {
  final List<Comment> comments;

  const CommentsLoadedState({required this.comments});
}

class CommentErrorState extends CommentState {
  final String message;

  const CommentErrorState(this.message);
}
