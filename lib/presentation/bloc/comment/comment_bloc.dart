import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:hw/domain/interfaces/i_comment_repository.dart';

import 'comment_events.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ICommentRepository _commentRepository;

  CommentBloc(this._commentRepository) : super(CommentInitialState()) {
    on<CommentsLoadEvent>(_onLoadList);
    on<CommentsAddEvent>(_onAddComment);
  }

  Future<void> _fetchComments(Emitter<CommentState> emit, int recipeId) async {
    final comments = await _commentRepository.getList(recipeId);
    emit(CommentsLoadedState(comments: comments));
  }

  Future<void> _onLoadList(
    CommentsLoadEvent event,
    Emitter<CommentState> emit,
  ) async {
    try {
      emit(CommentLoadingState());
      await _fetchComments(emit, event.recipeId);
    } catch (e) {
      emit(CommentErrorState(e.toString()));
    }
  }

  Future<void> _onAddComment(
    CommentsAddEvent event,
    Emitter<CommentState> emit,
  ) async {
    try {
      emit(CommentLoadingState());
      await _commentRepository.create(event.comment);
      await _fetchComments(emit, event.comment.recipeId);
    } catch (e) {
      emit(CommentErrorState(e.toString()));
    }
  }
}
