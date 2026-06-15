import 'package:flutter/material.dart';
import 'package:hw/domain/entities/ingredient.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;
  final int count;

  const IngredientItem({
    super.key,
    required this.ingredient,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final nameStyle = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    final quantityStyle = TextStyle(
      fontSize: 14,
      color: colorScheme.onSecondary,
      fontWeight: FontWeight.w500,
    );

    return Row(
      spacing: 8,
      children: [
        Text('•', style: nameStyle),
        Text(ingredient.name, style: nameStyle),
        Expanded(
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(count.toString(), style: quantityStyle),
              Text(ingredient.measureUnit.one, style: quantityStyle),
            ],
          ),
        ),
      ],
    );
  }
}
