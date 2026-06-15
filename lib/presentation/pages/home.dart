import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/bloc/recipe/recipe_bloc.dart';
import 'package:hw/presentation/bloc/recipe/recipe_state.dart';
import 'package:hw/presentation/widgets/recipe_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10 = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colorScheme.secondary,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: colorScheme.secondary,
        shadowColor: Colors.transparent,
      ),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoadingState || state is RecipeInitialState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is RecipesLoadedState) {
            return SafeArea(child: RecipeList(recipes: state.recipes));
          }

          if (state is RecipeErrorState) {
            debugPrint(state.message);
            return Text(state.message);
          }

          return Center(child: Text(l10.loadError));
        },
      ),
    );
  }
}
