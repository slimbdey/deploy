abstract class IngredientEvent {
  const IngredientEvent();
}

class IngredientsLoadEvent extends IngredientEvent {
  const IngredientsLoadEvent();
}

class IngredientsLoadRecipeIngredientsEvent extends IngredientEvent {
  const IngredientsLoadRecipeIngredientsEvent();
}
