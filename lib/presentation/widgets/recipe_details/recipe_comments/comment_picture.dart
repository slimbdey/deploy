import 'package:flutter/material.dart';
import 'package:hw/presentation/widgets/utils.dart';

class CommentPicture extends StatelessWidget {
  final String imagePath;

  const CommentPicture({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(color: colorScheme.secondary),
      child: SizedBox(
        width: double.infinity,
        height: 215,
        child: Utils.getRecipeImage(imagePath, double.infinity, 220),
      ),
    );
  }
}
