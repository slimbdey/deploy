import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_event.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/router/app_router_delegate.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;
    final bloc = context.read<AuthBloc>();

    return TextButton(
      onPressed: () {
        bloc.add(SignOutEvent());
        AppRouterDelegate.of(context).openAuth();
      },
      child: Text(
        l10.signOut,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}
