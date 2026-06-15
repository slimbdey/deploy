import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:hw/presentation/bloc/favorite/favorite_events.dart';
import 'package:hw/presentation/bloc/recipe/recipe_bloc.dart';
import 'package:hw/presentation/bloc/recipe/recipe_events.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/router/app_router_delegate.dart';
import 'package:hw/presentation/widgets/navigation/top_bar.dart';

import 'recipe_card.dart';
import 'utils.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;

  const RecipeList({super.key, required this.recipes});

  Future<void> _onRefresh(BuildContext context) async {
    final bloc = context.read<RecipeBloc>();
    bloc.add(RecipesLoadEvent());

    await bloc.stream.first;
  }

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

    if (recipes.isEmpty) {
      return RefreshIndicator(
        onRefresh: () => _onRefresh(context),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const TopBar(),
                Text(l10.noRecipes),
              ],
            ),
          ),
        ),
      );
    }

    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.black,
      displacement: 50.0,
      strokeWidth: 3.0,
      onRefresh: () => _onRefresh(context),
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          if (index == 0) return const SizedBox.shrink();
          return const SizedBox(height: 24);
        },
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        itemCount: recipes.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const TopBar();
          }

          final recipe = recipes[index - 1];
          return RecipeCard(
            recipeId: recipe.id,
            image: Utils.getRecipeImage(recipe.photo, 149, 149),
            title: recipe.name,
            durationText: '${recipe.duration} минут',
            onTap: () {
              AppRouterDelegate.of(context).openRecipeDetails(
                recipe.id,
                onClosed: () {
                  if (context.mounted) {
                    context.read<FavoriteBloc>().add(FavoritesLoadEvent());
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
