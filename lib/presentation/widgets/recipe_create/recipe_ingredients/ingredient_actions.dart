import 'package:flutter/material.dart';
import 'package:hw/domain/entities/ingredient.dart';
import 'package:hw/domain/entities/measure_unit.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';
import 'package:hw/presentation/widgets/forms/recipe_ingredient_form.dart';

class IngredientActions {
  static void handle({
    required BuildContext context,
    required GlobalKey<RecipeIngredientFormState> dataKey,
    required List<RecipeIngredient> currentIngredients,
    required Function(RecipeIngredient) onAdd,
    required Function(RecipeIngredient) onEdit,
    required MeasureUnit measureUnit,
    int? index,
  }) {
    final state = dataKey.currentState;
    if (state == null || !state.validate()) return;

    final values = state.getValues();

    if (index != null) {
      final old = currentIngredients[index];
      onEdit(
        RecipeIngredient(
          id: old.id,
          count: int.parse(values[1]),
          ingredient: Ingredient(
            id: old.ingredient.id,
            name: values[0],
            caloriesForUnit: old.ingredient.caloriesForUnit,
            measureUnit: measureUnit,
          ),
        ),
      );
    } else {
      final newId = currentIngredients.length;
      onAdd(
        RecipeIngredient(
          id: newId,
          count: int.parse(values[1]),
          ingredient: Ingredient(
            id: newId,
            name: values[0],
            caloriesForUnit: 0,
            measureUnit: measureUnit,
          ),
        ),
      );
    }

    Navigator.of(context).pop();
  }
}
