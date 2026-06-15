import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/form_subtitle.dart';
import 'package:hw/presentation/widgets/recipe_details/recipe_steps/recipe_step.dart';
import 'package:hw/presentation/widgets/form_submit_button.dart';

class RecipeSteps extends StatefulWidget {
  final Recipe recipe;

  const RecipeSteps({super.key, required this.recipe});

  @override
  State<RecipeSteps> createState() => _RecipeStepsState();
}

class _RecipeStepsState extends State<RecipeSteps> {
  bool _isRunned = false;

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

    return Column(
      spacing: 16,
      children: [
        FormSubtitle(label: l10.steps),
        if (widget.recipe.recipeSteps.isEmpty)
          Text(l10.noSteps)
        else
          Column(
            spacing: 24,
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.recipe.recipeSteps.length,
                itemBuilder: (context, index) {
                  final item = widget.recipe.recipeSteps[index];
                  return RecipeStep(item: item, isRunned: _isRunned);
                },
              ),
              FormSubmitButton(
                isLoading: false,
                isOutlined: _isRunned,
                label: _isRunned ? l10.stopCooking : l10.startCooking,
                onPressed: () => setState(() {
                  _isRunned = !_isRunned;
                }),
              ),
            ],
          ),
      ],
    );
  }
}
