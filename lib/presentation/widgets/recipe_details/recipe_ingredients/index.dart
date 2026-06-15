import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/form_subtitle.dart';
import 'package:hw/presentation/widgets/ingredients_card.dart';

class RecipeIngredients extends StatefulWidget {
  final Recipe recipe;
  const RecipeIngredients({super.key, required this.recipe});

  @override
  State<RecipeIngredients> createState() => _RecipeIngredientsState();
}

class _RecipeIngredientsState extends State<RecipeIngredients> {
  bool _mayBeCooked = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10 = AppLocalizations.of(context)!;

    return Column(
      spacing: 16,
      children: [
        FormSubtitle(label: l10.ingredients),
        IngredientsCard(
          recipeIngredients: widget.recipe.recipeIngredients,
          borderColor: _mayBeCooked
              ? colorScheme.onPrimaryFixedVariant
              : colorScheme.onPrimaryContainer,
        ),
        OutlinedButton(
          onPressed: () => setState(() {
            _mayBeCooked = !_mayBeCooked;
          }),
          child: Text(l10.checkStock),
        ),
      ],
    );
  }
}
