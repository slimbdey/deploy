import 'package:flutter/material.dart';
import 'package:hw/domain/entities/comment.dart';
import 'package:hw/presentation/widgets/utils.dart';
import 'package:intl/intl.dart';

class CommentList extends StatelessWidget {
  final List<Comment> comments;

  const CommentList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      spacing: 32,
      children: comments
          .map(
            (c) => Row(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: colorScheme.secondary,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 12,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 16,
                        children: [
                          Text('User1', style: textTheme.titleSmall),
                          Text(
                            DateFormat(
                              'dd.MM.yyyy',
                            ).format(DateTime.parse(c.datetime)),
                            style: textTheme.labelMedium,
                          ),
                        ],
                      ),
                      Text(c.text, style: textTheme.displayMedium),
                      if (c.photo.isNotEmpty)
                        Utils.getRecipeImage(c.photo, double.infinity, 220),
                    ],
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
