import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/entities/measure_unit.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';
import 'package:hw/domain/interfaces/i_measure_unit_repository.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/form_subtitle.dart';
import 'package:hw/presentation/widgets/forms/recipe_ingredient_form.dart';
import 'package:hw/presentation/widgets/modal.dart';
import 'package:hw/presentation/widgets/recipe_create/recipe_ingredients/ingredient_list.dart';

import 'ingredient_actions.dart';

class RecipeIngredients extends StatefulWidget {
  final List<RecipeIngredient> recipeIngredients;
  final Function(RecipeIngredient ingredient) onAddIngredient;
  final Function(RecipeIngredient ingredient) onEditIngredient;
  final Function(RecipeIngredient ingredient) onDeleteIngredient;
  final GlobalKey<RecipeIngredientFormState> dataKey = GlobalKey();

  RecipeIngredients({
    super.key,
    required this.recipeIngredients,
    required this.onAddIngredient,
    required this.onEditIngredient,
    required this.onDeleteIngredient,
  });

  @override
  State<RecipeIngredients> createState() => _RecipeIngredientFormState();
}

class _RecipeIngredientFormState extends State<RecipeIngredients> {
  late final List<MeasureUnit> _measureUnits;

  @override
  void initState() {
    super.initState();

    final measureUnitRepository = context.read<IMeasureUnitRepository>();
    measureUnitRepository.getList().then(
          (list) => setState(() {
            _measureUnits = list;
          }),
        );
  }

  void _handle(BuildContext context, int? index) {
    IngredientActions.handle(
      context: context,
      dataKey: widget.dataKey,
      currentIngredients: widget.recipeIngredients,
      onAdd: widget.onAddIngredient,
      onEdit: widget.onEditIngredient,
      measureUnit: _measureUnits[0],
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
          child: FormSubtitle(label: l10.ingredients),
        ),
        if (widget.recipeIngredients.isEmpty)
          Text(l10.noIngredients, style: textScheme.bodySmall)
        else
          IngredientList(
            recipeIngredients: widget.recipeIngredients,
            dataKey: widget.dataKey,
            onDeleteIngredient: widget.onDeleteIngredient,
            handle: _handle,
          ),
        OutlinedButton(
          onPressed: () => Modal.open(
            context,
            l10.ingredient,
            RecipeIngredientForm(key: widget.dataKey, formKey: GlobalKey()),
            () => _handle(context, null),
          ),
          child: Text(l10.addIngredients),
        ),
      ],
    );
  }
}
