import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/bloc/comment/comment_bloc.dart';
import 'package:hw/presentation/bloc/comment/comment_events.dart';
import 'package:hw/presentation/bloc/comment/comment_state.dart';
import 'package:hw/presentation/widgets/recipe_details/recipe_comments/comment_editor.dart';
import 'package:hw/presentation/widgets/recipe_details/recipe_comments/comment_list.dart';

class RecipeComments extends StatefulWidget {
  final Recipe recipe;

  const RecipeComments({super.key, required this.recipe});

  @override
  State<RecipeComments> createState() => _RecipeCommentsState();
}

class _RecipeCommentsState extends State<RecipeComments> {
  void _loadComments() {
    final commentBloc = context.read<CommentBloc>();
    commentBloc.add(CommentsLoadEvent(recipeId: widget.recipe.id));
  }

  @override
  void initState() {
    _loadComments();
    super.initState();
  }

  @override
  void didUpdateWidget(RecipeComments oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.recipe.id != oldWidget.recipe.id) {
      _loadComments();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        if (state is CommentErrorState) {
          return Center(child: Text(state.message));
        }

        if (state is CommentLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CommentsLoadedState) {
          return Column(
            spacing: 32,
            children: [
              if (state.comments.isNotEmpty)
                CommentList(comments: state.comments),
              CommentEditor(recipeId: widget.recipe.id),
            ],
          );
        }

        return Text(l10.unknownCommentState);
      },
    );
  }
}
