import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:hw/domain/interfaces/i_recipe_repository.dart';

import 'recipe_events.dart';
import 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final IRecipeRepository _repository;

  RecipeBloc(this._repository) : super(RecipeInitialState()) {
    on<RecipesLoadEvent>(_onLoadList);
    on<RecipesAddEvent>(_onAddRecipe);
  }

  Future<void> _fetchRecipes(Emitter<RecipeState> emit) async {
    final result = await _repository.getList();
    emit(RecipesLoadedState(recipes: result));
  }

  Future<void> _onLoadList(
    RecipesLoadEvent event,
    Emitter<RecipeState> emit,
  ) async {
    try {
      emit(RecipeLoadingState());
      await _fetchRecipes(emit);
    } catch (e) {
      emit(RecipeErrorState(e.toString()));
    }
  }

  Future<void> _onAddRecipe(
    RecipesAddEvent event,
    Emitter<RecipeState> emit,
  ) async {
    try {
      emit(RecipeLoadingState());
      await _repository.create(event.recipe);
      await _fetchRecipes(emit);
    } catch (e) {
      emit(RecipeErrorState(e.toString()));
    }
  }
}
