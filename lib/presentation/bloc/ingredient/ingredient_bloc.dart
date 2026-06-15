import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:hw/domain/entities/ingredient.dart';
import 'package:hw/domain/entities/recipe_ingredient.dart';
import 'package:hw/domain/interfaces/i_ingredient_repository.dart';

import 'ingredient_events.dart';
import 'ingredient_state.dart';

class IngredientBloc extends Bloc<IngredientEvent, IngredientState> {
  final IIngredientRepository _repository;

  IngredientBloc(this._repository) : super(IngredientInitialState()) {
    on<IngredientsLoadEvent>(_onLoadList);
    on<IngredientsLoadRecipeIngredientsEvent>(_onLoadRecipeIngredients);
  }

  Future<List<Ingredient>> _fetchIngredients(
      Emitter<IngredientState> emit) async {
    await Future.delayed(const Duration(milliseconds: 200));

    final result = await _repository.getFridgeList();
    return result;
  }

  Future<void> _onLoadList(
    IngredientsLoadEvent event,
    Emitter<IngredientState> emit,
  ) async {
    try {
      emit(IngredientLoadingState());
      final ingredients = await _fetchIngredients(emit);
      emit(IngredientsLoadedState(ingredients: ingredients));
    } catch (e) {
      emit(IngredientErrorState(e.toString()));
    }
  }

  Future<void> _onLoadRecipeIngredients(
    IngredientsLoadRecipeIngredientsEvent event,
    Emitter<IngredientState> emit,
  ) async {
    try {
      emit(IngredientLoadingState());
      final ingredients = await _fetchIngredients(emit);
      final recipeIngredients = ingredients
          .asMap()
          .entries
          .map(
            (entry) => RecipeIngredient(
              id: entry.key,
              count: 5,
              ingredient: entry.value,
            ),
          )
          .toList();
      emit(IngredientsLoadedRecipeIngredientState(
          recipeIngredients: recipeIngredients));
    } catch (e) {
      emit(IngredientErrorState(e.toString()));
    }
  }
}
