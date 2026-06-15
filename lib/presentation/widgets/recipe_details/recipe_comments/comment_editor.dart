import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/entities/comment.dart';
import 'package:hw/presentation/bloc/comment/comment_bloc.dart';
import 'package:hw/presentation/bloc/comment/comment_events.dart';
import 'package:hw/presentation/widgets/picture_actions.dart';

import 'comment_input.dart';
import 'comment_picture.dart';

class CommentEditor extends StatefulWidget {
  final int recipeId;

  const CommentEditor({super.key, required this.recipeId});

  @override
  State<CommentEditor> createState() => _CommentEditorState();
}

class _CommentEditorState extends State<CommentEditor> {
  final TextEditingController _commentController = TextEditingController();
  String _imagePath = '';

  void _imageSelectedInterceptor(File? image) {
    final path = image?.path ?? '';
    setState(() {
      _imagePath = path;
    });
  }

  void _onImageDelete() => setState(() {
        _imagePath = '';
      });

  void submit(BuildContext context) async {
    if (_commentController.text.isEmpty) {
      return;
    }

    final commentBloc = context.read<CommentBloc>();
    final comment = Comment(
      id: 0,
      text: _commentController.text,
      photo: _imagePath,
      datetime: DateTime.now().toIso8601String(),
      recipeId: widget.recipeId,
    );

    commentBloc.add(CommentsAddEvent(comment));
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final actions = PictureActions(
      onImageSelected: _imageSelectedInterceptor,
      onImageDelete: _onImageDelete,
    );

    return Column(
      spacing: 8,
      children: [
        CommentInput(
          controller: _commentController,
          onIconPressed: () => actions.showPicker(context),
          onSubmit: () => submit(context),
        ),
        if (_imagePath.isNotEmpty) CommentPicture(imagePath: _imagePath),
      ],
    );
  }
}
