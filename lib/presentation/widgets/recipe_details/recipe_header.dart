import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/entities/favorite.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:hw/presentation/bloc/favorite/favorite_events.dart';
import 'package:hw/presentation/bloc/favorite/favorite_state.dart';
import 'package:hw/presentation/widgets/recipe_details/heart_checkbox/index.dart';
import 'package:hw/presentation/widgets/recipe_title.dart';

class RecipeHeader extends StatefulWidget {
  final Recipe recipe;

  const RecipeHeader({super.key, required this.recipe});

  @override
  State<RecipeHeader> createState() => _RecipeHeaderState();
}

class _RecipeHeaderState extends State<RecipeHeader> {
  late FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    super.initState();

    _favoriteBloc = context.read<FavoriteBloc>();
  }

  void _handleToggle(BuildContext context, bool shouldBeFavorite) {
    if (shouldBeFavorite) {
      _favoriteBloc.add(
        FavoritesAddEvent(Favorite(id: 0, recipeId: widget.recipe.id)),
      );
      return;
    }

    _favoriteBloc.add(FavoritesDeleteEvent(widget.recipe.id));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RecipeTitle(
            durationText: '${widget.recipe.duration} минут',
            title: widget.recipe.name,
          ),
        ),
        BlocSelector<FavoriteBloc, FavoriteState, bool>(
          selector: (state) {
            if (state is FavoritesLoadedState) {
              return state.favoriteRecipes.any((r) => r.id == widget.recipe.id);
            }
            return false;
          },
          builder: (context, isFavorite) {
            return HeartCheckbox(
              value: isFavorite,
              onChanged: (value) => _handleToggle(context, value),
            );
          },
        ),
      ],
    );
  }
}
