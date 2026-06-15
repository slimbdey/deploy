import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:hw/presentation/bloc/favorite/favorite_state.dart';
import 'package:hw/presentation/widgets/recipe_list.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

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
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FavoritesLoadedState) {
            return SafeArea(child: RecipeList(recipes: state.favoriteRecipes));
          }

          if (state is FavoriteErrorState) {
            return Center(child: Text(state.message));
          }

          return Center(child: Text(l10.loadError));
        },
      ),
    );
  }
}
