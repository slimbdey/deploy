import 'package:flutter/material.dart';
import 'package:hw/presentation/pages/recipe_create.dart';
import 'package:hw/presentation/pages/recipe_details.dart';
import 'package:hw/presentation/widgets/navigation/shell.dart';

import 'app_route_path.dart';
import 'app_transition_page.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppRoutePath _path = const AppRoutePath.home();
  VoidCallback? _onCreateRecipeCompleted;
  VoidCallback? _onRecipeDetailsClosed;

  static AppRouterDelegate of(BuildContext context) {
    return Router.of(context).routerDelegate as AppRouterDelegate;
  }

  @override
  AppRoutePath get currentConfiguration => _path;

  void openRecipeCreate({VoidCallback? onCompleted}) {
    _path = const AppRoutePath.recipeCreate();
    _onCreateRecipeCompleted = onCompleted;
    _onRecipeDetailsClosed = null;
    notifyListeners();
  }

  void openRecipeDetails(int recipeId, {VoidCallback? onClosed}) {
    _path = AppRoutePath.recipeDetails(recipeId);
    _onCreateRecipeCompleted = null;
    _onRecipeDetailsClosed = onClosed;
    notifyListeners();
  }

  void openAuth() {
    _path = const AppRoutePath.auth();
    notifyListeners();
  }

  void openHome() {
    _path = const AppRoutePath.home();
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    _path = configuration;
    _onCreateRecipeCompleted = null;
    _onRecipeDetailsClosed = null;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const AppTransitionPage(
          key: ValueKey('home'),
          child: Shell(),
        ),
        if (_path.isCreateRecipe)
          AppTransitionPage(
            key: const ValueKey('recipes-create'),
            onPopInvoked: (didPop, result) {
              if (didPop && result == true) {
                _onCreateRecipeCompleted?.call();
              }
            },
            child: const NewRecipe(),
          ),
        if (_path.recipeId != null)
          AppTransitionPage(
            key: ValueKey('recipes-${_path.recipeId}'),
            child: RecipeDetails(recipeId: _path.recipeId!),
          ),
      ],
      onDidRemovePage: (page) {
        if (page.key == const ValueKey('home')) return;

        if (page.key != const ValueKey('recipes-create')) {
          _onRecipeDetailsClosed?.call();
        }

        _path = const AppRoutePath.home();
        _onCreateRecipeCompleted = null;
        _onRecipeDetailsClosed = null;
        notifyListeners();
      },
    );
  }
}
