import 'package:flutter/material.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';
import 'package:hw/presentation/widgets/forms/recipe_ingredient_form.dart';
import 'package:hw/presentation/widgets/modal.dart';

import 'ingredient_edit_item.dart';

class IngredientList extends StatelessWidget {
  final GlobalKey<RecipeIngredientFormState> dataKey;
  final Function(RecipeIngredient ingredient) onDeleteIngredient;
  final Function(BuildContext context, int? index) handle;
  final List<RecipeIngredient> recipeIngredients;

  const IngredientList({
    super.key,
    required this.recipeIngredients,
    required this.dataKey,
    required this.onDeleteIngredient,
    required this.handle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: recipeIngredients.asMap().entries.map((entry) {
        final recipeIngredient = entry.value;
        final index = entry.key;

        return IngredientEditItem(
          recipeIngredient: recipeIngredient,
          edit: () => Modal.open(
            context,
            'Ингредиент',
            RecipeIngredientForm(
              key: dataKey,
              formKey: GlobalKey(),
              initialValues: [
                recipeIngredient.ingredient.name,
                entry.value.count.toString(),
              ],
            ),
            () => handle(context, index),
          ),
          delete: () => onDeleteIngredient(entry.value),
        );
      }).toList(),
    );
  }
}
