import 'package:flutter/material.dart';

class RecipeTitle extends StatelessWidget {
  final String title;
  final String durationText;

  const RecipeTitle({
    super.key,
    required this.durationText,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final textScheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textScheme.titleLarge,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.access_time, size: 16, color: Colors.black),
            const SizedBox(width: 11),
            Text(
              durationText,
              style: TextStyle(color: colorScheme.onPrimaryFixedVariant),
            ),
          ],
        ),
      ],
    );
  }
}
