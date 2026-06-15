import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe_step_link.dart';
import 'package:hw/presentation/widgets/forms/recipe_step_form.dart';
import 'package:hw/presentation/widgets/modal.dart';

import 'step_item.dart';

class StepList extends StatelessWidget {
  final GlobalKey<RecipeStepFormState> dataKey;
  final Function(RecipeStepLink ingredient) onDeleteStep;
  final Function(BuildContext context, int? index) handle;
  final List<RecipeStepLink> steps;

  const StepList({
    super.key,
    required this.steps,
    required this.dataKey,
    required this.onDeleteStep,
    required this.handle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: steps.asMap().entries.map((entry) {
        final stepLink = entry.value;
        final index = entry.key;

        return StepItem(
          stepLink: stepLink,
          edit: () => Modal.open(
            context,
            'Шаг рецепта',
            RecipeStepForm(
              key: dataKey,
              formKey: GlobalKey(),
              editStep: stepLink.step,
            ),
            () => handle(context, index),
          ),
          delete: () => onDeleteStep(entry.value),
        );
      }).toList(),
    );
  }
}
