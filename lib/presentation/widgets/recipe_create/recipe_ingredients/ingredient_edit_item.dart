import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';
import 'package:hw/presentation/widgets/form_control_button.dart';

class IngredientEditItem extends StatelessWidget {
  final RecipeIngredient recipeIngredient;
  final VoidCallback edit;
  final VoidCallback delete;

  const IngredientEditItem({
    super.key,
    required this.recipeIngredient,
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
      child: SizedBox(
        height: 56,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    recipeIngredient.ingredient.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${recipeIngredient.count.toString()} ${recipeIngredient.ingredient.measureUnit.one}',
                    style: TextStyle(color: colors.onSecondary, fontSize: 12),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FormControlButton(onClick: edit, icon: Icons.edit),
                  FormControlButton(onClick: delete, icon: Icons.delete),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
