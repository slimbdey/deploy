import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe_step.dart';
import 'package:hw/domain/entities/recipe_step_link.dart';
import 'package:hw/presentation/widgets/forms/recipe_step_form.dart';

class StepActions {
  static void handle({
    required BuildContext context,
    required GlobalKey<RecipeStepFormState> dataKey,
    required List<RecipeStepLink> currentSteps,
    required Function(RecipeStepLink) onAdd,
    required Function(RecipeStepLink) onEdit,
    int? index,
  }) {
    final state = dataKey.currentState;
    if (state == null || !state.validate()) return;

    final step = state.getStep();

    if (index != null) {
      final old = currentSteps[index];
      onEdit(RecipeStepLink(id: old.id, number: old.number, step: step));
    } else {
      final newId = currentSteps.length;
      onAdd(
        RecipeStepLink(
          id: newId,
          number: newId,
          step: RecipeStep(
            id: newId,
            duration: step.duration,
            content: step.content,
          ),
        ),
      );
    }

    Navigator.of(context).pop();
  }
}
