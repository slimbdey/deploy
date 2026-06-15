class AppRoutePath {
  const AppRoutePath.home()
      : recipeId = null,
        isCreateRecipe = false;

  const AppRoutePath.recipeCreate()
      : recipeId = null,
        isCreateRecipe = true;

  const AppRoutePath.recipeDetails(this.recipeId) : isCreateRecipe = false;

  const AppRoutePath.auth()
      : recipeId = null,
        isCreateRecipe = false;

  final int? recipeId;
  final bool isCreateRecipe;

  String get location {
    if (isCreateRecipe) return '/recipes/create';
    if (recipeId != null) return '/recipes/$recipeId';
    return '/';
  }
}
