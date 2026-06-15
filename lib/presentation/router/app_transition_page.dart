import 'package:flutter/material.dart';

class AppTransitionPage extends Page<Object?> {
  const AppTransitionPage({
    required this.child,
    super.key,
    super.onPopInvoked,
  });

  final Widget child;

  static const transitionDuration = Duration(milliseconds: 400);
  static const reverseTransitionDuration = Duration(milliseconds: 300);

  @override
  Route<Object?> createRoute(BuildContext context) {
    return PageRouteBuilder<Object?>(
      settings: this,
      pageBuilder: (_, __, ___) => child,
      transitionDuration: transitionDuration,
      reverseTransitionDuration: reverseTransitionDuration,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        if (animation.status == AnimationStatus.forward) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          );
        }

        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
