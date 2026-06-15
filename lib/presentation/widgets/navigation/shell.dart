import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_state.dart';
import 'package:hw/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:hw/presentation/bloc/favorite/favorite_events.dart';
import 'package:hw/presentation/bloc/ingredient/ingredient_bloc.dart';
import 'package:hw/presentation/bloc/ingredient/ingredient_events.dart';
import 'package:hw/presentation/bloc/recipe/recipe_bloc.dart';
import 'package:hw/presentation/bloc/recipe/recipe_events.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/pages/favorites.dart';
import 'package:hw/presentation/pages/fridge.dart';
import 'package:hw/presentation/router/app_router_delegate.dart';
import 'package:hw/presentation/widgets/navigation/nav_bar.dart';

import '../../pages/home.dart';
import '../../pages/login.dart';

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  late int _currentIndex;
  late final List<Widget> _tabs;
  late final RecipeBloc _recipeBloc;
  late final IngredientBloc _ingredientBloc;
  late final FavoriteBloc _favoriteBloc;
  late final PageController _pageController;
  late final AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();

    _ingredientBloc = context.read<IngredientBloc>();
    _recipeBloc = context.read<RecipeBloc>()..add(RecipesLoadEvent());
    _favoriteBloc = context.read<FavoriteBloc>()..add(FavoritesLoadEvent());
    _authBloc = context.read<AuthBloc>();

    final isAuthorized = _authBloc.state is AuthSignedInState;
    _currentIndex = isAuthorized ? 0 : 3;

    _pageController = PageController(initialPage: _currentIndex);

    _tabs = const [
      HomePage(key: PageStorageKey('home')),
      FridgePage(key: PageStorageKey('fridge')),
      FavoritesPage(key: PageStorageKey('favorites')),
      LoginPage(key: PageStorageKey('login')),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedInState) {
          _pageController.jumpToPage(0);
        } else if (state is AuthInitialState || state is AuthSignedOutState) {
          _pageController.jumpToPage(3);
        }
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _tabs,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
        ),
        floatingActionButton: _currentIndex == 3 ||
                _authBloc.state is! AuthSignedInState
            ? null
            : FloatingActionButton(
                onPressed: () {
                  AppRouterDelegate.of(context).openRecipeCreate(
                    onCompleted: () {
                      if (!context.mounted) return;

                      _recipeBloc.add(const RecipesLoadEvent());

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(l10.dataSaved)));
                    },
                  );
                },
                child: const Icon(Icons.add),
              ),
        bottomNavigationBar: NavBar(
          isSignedIn: _authBloc.state is AuthSignedInState,
          currentIndex: _currentIndex,
          onTap: (int index) {
            if (index == 0) _recipeBloc.add(RecipesLoadEvent());
            if (index == 1) {
              _ingredientBloc.add(IngredientsLoadRecipeIngredientsEvent());
            }
            if (index == 2) _favoriteBloc.add(FavoritesLoadEvent());

            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
