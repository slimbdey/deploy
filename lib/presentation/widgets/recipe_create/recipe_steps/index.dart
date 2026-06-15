import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe_step_link.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/form_subtitle.dart';
import 'package:hw/presentation/widgets/forms/recipe_step_form.dart';
import 'package:hw/presentation/widgets/modal.dart';

import 'step_actions.dart';
import 'step_list.dart';

class RecipeSteps extends StatefulWidget {
  final List<RecipeStepLink> steps;
  final Function(RecipeStepLink step) onAddStep;
  final Function(RecipeStepLink step) onEditStep;
  final Function(RecipeStepLink step) onDeleteStep;
  final GlobalKey<RecipeStepFormState> dataKey = GlobalKey();

  RecipeSteps({
    super.key,
    required this.steps,
    required this.onAddStep,
    required this.onEditStep,
    required this.onDeleteStep,
  });

  @override
  State<RecipeSteps> createState() => _RecipeStepFormState();
}

class _RecipeStepFormState extends State<RecipeSteps> {
  void _handle(BuildContext context, int? index) {
    StepActions.handle(
      context: context,
      dataKey: widget.dataKey,
      currentSteps: widget.steps,
      onAdd: widget.onAddStep,
      onEdit: widget.onEditStep,
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textScheme = Theme.of(context).textTheme;
    final l10 = AppLocalizations.of(context)!;

    return Column(
      spacing: 13,
      children: [
        Align(
          alignment: AlignmentGeometry.centerLeft,
          child: FormSubtitle(label: l10.steps),
        ),
        if (widget.steps.isEmpty)
          Text(l10.noSteps, style: textScheme.bodySmall)
        else
          StepList(
            steps: widget.steps,
            dataKey: widget.dataKey,
            onDeleteStep: widget.onDeleteStep,
            handle: _handle,
          ),
        OutlinedButton(
          onPressed: () => Modal.open(
            context,
            l10.recipeStep,
            RecipeStepForm(key: widget.dataKey, formKey: GlobalKey()),
            () => _handle(context, null),
          ),
          child: Text(l10.addStep),
        ),
      ],
    );
  }
}
