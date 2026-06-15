import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe_step_link.dart';
import 'package:hw/presentation/widgets/recipe_details/recipe_steps/step_checkbox.dart';
import 'package:hw/presentation/widgets/step_duration.dart';

class RecipeStep extends StatefulWidget {
  final RecipeStepLink item;
  final bool isRunned;

  const RecipeStep({super.key, required this.item, required this.isRunned});

  @override
  State<RecipeStep> createState() => _RecipeStepState();
}

class _RecipeStepState extends State<RecipeStep> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedColor = colorScheme.onPrimaryFixed;

    return ListTile(
      minTileHeight: 80,
      selected: widget.isRunned,
      selectedTileColor: colorScheme.tertiary,
      selectedColor: selectedColor,
      textColor: colorScheme.onSecondary,
      horizontalTitleGap: 24,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      tileColor: colorScheme.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      leading: Text(
        (widget.item.number + 1).toString(),
        style: TextStyle(
          fontSize: 40,
          color: widget.isRunned
              ? colorScheme.onTertiaryFixedVariant
              : colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w900,
        ),
      ),
      title: Text(
        widget.item.step.content,
        style: TextStyle(
          fontSize: 12,
          height: 1.5,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Wrap(
        children: [
          Column(
            spacing: 8,
            children: [
              if (widget.isRunned) StepCheckbox(isRunned: widget.isRunned),
              StepDuration(
                stepLink: widget.item,
                color:
                    widget.isRunned ? selectedColor : colorScheme.onSecondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
