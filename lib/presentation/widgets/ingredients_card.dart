import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/form_subtitle.dart';

import 'ingredient_item.dart';

class IngredientsCard extends StatelessWidget {
  final List<RecipeIngredient> recipeIngredients;
  final Color borderColor;
  final String? subtitle;

  const IngredientsCard({
    super.key,
    required this.recipeIngredients,
    this.subtitle,
    this.borderColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsetsGeometry.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: borderColor, width: 3),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              if (subtitle != null) FormSubtitle(label: subtitle!),
              if (recipeIngredients.isEmpty)
                Text(l10.noIngredients)
              else
                ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recipeIngredients.length,
                  itemBuilder: (context, index) {
                    final item = recipeIngredients[index];
                    return IngredientItem(
                      ingredient: item.ingredient,
                      count: item.count,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
