import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/presentation/bloc/recipe/recipe_bloc.dart';
import 'package:hw/presentation/bloc/recipe/recipe_state.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/recipe_details/recipe_comments/index.dart';
import 'package:hw/presentation/widgets/recipe_details/recipe_header.dart';
import 'package:hw/presentation/widgets/recipe_details/recipe_ingredients/index.dart';
import 'package:hw/presentation/widgets/recipe_details/recipe_steps/index.dart';
import 'package:hw/presentation/widgets/recipe_details/wrapper.dart';
import 'package:hw/presentation/widgets/utils.dart';

class RecipeDetails extends StatelessWidget {
  final int recipeId;
  const RecipeDetails({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RecipeBloc>().state;
    final l10 = AppLocalizations.of(context)!;

    if (state is RecipesLoadedState) {
      final recipe = state.recipes.cast<Recipe?>().firstWhere(
            (r) => r?.id == recipeId,
            orElse: () => null,
          );

      if (recipe == null) {
        return Center(child: Text(l10.recipeNotFound));
      }

      return Wrapper(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 48),
          child: Column(
            spacing: 32,
            children: [
              RecipeHeader(recipe: recipe),
              Stack(children: [
                Utils.getRecipeImage(recipe.photo, double.infinity, 220),
              ]),
              RecipeIngredients(recipe: recipe),
              RecipeSteps(recipe: recipe),
              const Divider(),
              RecipeComments(recipe: recipe),
            ],
          ),
        ),
      );
    }

    return Wrapper(child: const Center(child: CircularProgressIndicator()));
  }
}
