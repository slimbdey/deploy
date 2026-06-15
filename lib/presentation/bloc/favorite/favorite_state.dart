import 'package:hw/domain/entities/recipe.dart';

abstract class FavoriteState {
  final List<Recipe> favoriteRecipes;
  const FavoriteState({this.favoriteRecipes = const []});
}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {
  const FavoriteLoadingState({super.favoriteRecipes});
}

class FavoritesLoadedState extends FavoriteState {
  const FavoritesLoadedState({required super.favoriteRecipes});
}

class FavoriteErrorState extends FavoriteState {
  final String message;
  const FavoriteErrorState(this.message, {super.favoriteRecipes});
}
