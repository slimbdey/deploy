import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/bloc/ingredient/ingredient_bloc.dart';
import 'package:hw/presentation/bloc/ingredient/ingredient_state.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/ingredients_card.dart';
import 'package:hw/presentation/widgets/navigation/top_bar.dart';

class FridgePage extends StatelessWidget {
  const FridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10 = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colorScheme.secondary,
      body: BlocBuilder<IngredientBloc, IngredientState>(
          builder: (context, state) {
        if (state is IngredientLoadingState ||
            state is IngredientInitialState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is IngredientErrorState) {
          return Center(child: Text(state.message));
        }

        if (state is IngredientsLoadedRecipeIngredientState) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const TopBar(),
                  IngredientsCard(
                    recipeIngredients: state.recipeIngredients,
                    subtitle: l10.fridgeContent,
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {},
                    child: Text(
                      softWrap: false,
                      overflow: TextOverflow.visible,
                      l10.suggestRecipes,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Center(child: Text(l10.loadError));
      }),
    );
  }
}
