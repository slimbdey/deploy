import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_event.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/navigation/top_bar.dart';

class ProfileForm extends StatelessWidget {
  final User user;

  const ProfileForm({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final darkGreenBorder = colorScheme.onPrimaryFixed;
    final textColor = colorScheme.onPrimaryFixed;
    final brightGreen = colorScheme.onPrimaryFixedVariant;
    final logoutRed = colorScheme.error;
    final l10 = AppLocalizations.of(context)!;

    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TopBar(hideSignOut: true),
              const SizedBox(height: 24),
              Container(
                width: 123,
                height: 123,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(color: darkGreenBorder, width: 3.0),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/default-user.png',
                    width: 96,
                    height: 96,
                  ),
                ),
              ),
              const SizedBox(height: 1),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 4.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10.login,
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                    Text(
                      user.email ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: brightGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(SignOutEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: logoutRed,
                    elevation: 4,
                    shadowColor: Colors.black.withValues(alpha: 0.2),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ).copyWith(
                    overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered)) {
                          return Colors.grey[100];
                        }
                        if (states.contains(WidgetState.pressed)) {
                          return Colors.grey[200];
                        }
                        return null;
                      },
                    ),
                  ),
                  child: Text(
                    l10.signOut,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
