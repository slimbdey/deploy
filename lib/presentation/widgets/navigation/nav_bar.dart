import 'package:flutter/material.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/bloc/auth/auth_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_item.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool isSignedIn;

  const NavBar(
      {super.key,
      required this.currentIndex,
      required this.onTap,
      required this.isSignedIn});

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

    return BlocSelector<AuthBloc, AuthState, bool>(
      selector: (state) => state is AuthSignedInState,
      builder: (context, isSignedIn) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                offset: Offset(0, 0),
                color: Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ],
          ),
          child: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: NavItem(
                    title: l10.recipes,
                    asset: 'assets/icons/recipes.png',
                    selected: currentIndex == 0,
                    onTap: () => onTap(0),
                  ),
                ),
                if (isSignedIn)
                  Expanded(
                    child: NavItem(
                      title: l10.fridge,
                      asset: 'assets/icons/fridge.png',
                      selected: currentIndex == 1,
                      onTap: () => onTap(1),
                    ),
                  ),
                if (isSignedIn)
                  Expanded(
                    child: NavItem(
                      title: l10.favorites,
                      asset: 'assets/icons/favorites.png',
                      selected: currentIndex == 2,
                      onTap: () => onTap(2),
                    ),
                  ),
                Expanded(
                  child: NavItem(
                    title: isSignedIn ? l10.profile : l10.signInCaption,
                    asset: 'assets/icons/login.png',
                    selected: currentIndex == 3,
                    onTap: () => onTap(3),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
