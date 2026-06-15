import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe_step_link.dart';
import 'package:hw/presentation/widgets/form_control_button.dart';
import 'package:hw/presentation/widgets/step_duration.dart';

class StepItem extends StatelessWidget {
  final RecipeStepLink stepLink;
  final VoidCallback edit;
  final VoidCallback delete;

  const StepItem({
    super.key,
    required this.stepLink,
    required this.edit,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: colors.onSecondary, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 8, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Шаг ${(stepLink.number + 1).toString()}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  stepLink.step.content,
                  style: TextStyle(
                    color: colors.onSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8,
              children: [
                StepDuration(stepLink: stepLink, color: Colors.black),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FormControlButton(onClick: edit, icon: Icons.edit),
                    FormControlButton(onClick: delete, icon: Icons.delete),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
