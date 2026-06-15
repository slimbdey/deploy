import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_state.dart';
import 'package:hw/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:hw/presentation/bloc/favorite/favorite_events.dart';
import 'package:hw/domain/entities/favorite.dart';
import 'package:hw/presentation/bloc/favorite/favorite_state.dart';
import 'package:hw/presentation/widgets/recipe_details/heart_checkbox/index.dart';
import 'package:hw/presentation/widgets/recipe_title.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipeId,
    required this.image,
    required this.title,
    required this.durationText,
    this.onTap,
  });

  final int recipeId;
  final Widget image;
  final String title;
  final String durationText;
  final VoidCallback? onTap;
  final double height = 136;
  final double borderRadius = 5;

  void _handleToggle(BuildContext context, bool shouldBeFavorite) {
    final favoriteBloc = context.read<FavoriteBloc>();

    if (shouldBeFavorite) {
      favoriteBloc.add(
        FavoritesAddEvent(Favorite(id: 0, recipeId: recipeId)),
      );
      return;
    }

    favoriteBloc.add(FavoritesDeleteEvent(recipeId));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSignedIn = context.read<AuthBloc>().state is AuthSignedInState;

    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 2,
            color: Color.fromRGBO(149, 146, 146, 0.1),
          ),
        ],
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: SizedBox(
          height: height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
                child: image,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: RecipeTitle(durationText: durationText, title: title),
                ),
              ),
              if (isSignedIn)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: BlocSelector<FavoriteBloc, FavoriteState, bool>(
                      selector: (state) {
                        return state.favoriteRecipes
                            .any((recipe) => recipe.id == recipeId);
                      },
                      builder: (context, isFavorite) {
                        return HeartCheckbox(
                          value: isFavorite,
                          hitSize: 48,
                          onChanged: (value) => _handleToggle(context, value),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
