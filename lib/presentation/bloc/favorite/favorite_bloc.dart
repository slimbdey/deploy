import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:hw/domain/entities/favorite.dart';
import 'package:hw/domain/entities/recipe.dart';
import 'package:hw/domain/interfaces/i_favorite_repository.dart';
import 'package:hw/domain/interfaces/i_recipe_repository.dart';

import 'favorite_events.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final IFavoriteRepository _favoriteRepository;
  final IRecipeRepository _recipeRepository;

  FavoriteBloc(this._favoriteRepository, this._recipeRepository)
      : super(FavoriteInitialState()) {
    on<FavoritesLoadEvent>(_onLoadList);
    on<FavoritesAddEvent>(_onAddFavorite);
    on<FavoritesDeleteEvent>(_onDeleteFavorite);
  }

  Future<void> _fetchFavorites(Emitter<FavoriteState> emit) async {
    final [
      favorites as List<Favorite>,
      allRecipes as List<Recipe>,
    ] = await Future.wait([
      _favoriteRepository.getList(),
      _recipeRepository.getList(),
    ]);

    final result = allRecipes.where((recipe) {
      return favorites.any((f) => f.recipeId == recipe.id);
    }).toList();
    emit(FavoritesLoadedState(favoriteRecipes: result));
  }

  Future<void> _onLoadList(
    FavoritesLoadEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      emit(FavoriteLoadingState(favoriteRecipes: state.favoriteRecipes));
      await _fetchFavorites(emit);
    } catch (e) {
      emit(FavoriteErrorState(e.toString()));
    }
  }

  Future<void> _onAddFavorite(
    FavoritesAddEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await _favoriteRepository.create(event.favorite);
      await _fetchFavorites(emit);
    } catch (e) {
      emit(FavoriteErrorState(e.toString()));
    }
  }

  Future<void> _onDeleteFavorite(
    FavoritesDeleteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await _favoriteRepository.delete(event.id);
      await _fetchFavorites(emit);
    } catch (e) {
      emit(FavoriteErrorState(e.toString()));
    }
  }
}
