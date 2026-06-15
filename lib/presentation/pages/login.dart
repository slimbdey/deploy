import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_bloc.dart';
import 'package:hw/presentation/bloc/auth/auth_event.dart';
import 'package:hw/presentation/bloc/auth/auth_state.dart';
import 'package:hw/presentation/bloc/auth/utils.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/router/app_router_delegate.dart';
import 'package:hw/presentation/widgets/forms/auth_form.dart';
import 'package:hw/presentation/widgets/forms/profile_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  void toggleAuthMode() => context.read<AuthBloc>().add(ToggleAuthModeEvent());

  void signInHandler() => context
      .read<AuthBloc>()
      .add(SignInEvent(_loginController.text, _passwordController.text));

  void signUpHandler() => context.read<AuthBloc>().add(SignUpEvent(
      _loginController.text,
      _passwordController.text,
      _passwordAgainController.text));

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10 = AppLocalizations.of(context)!;

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedInState) {
          AppRouterDelegate.of(context).openHome();
        }
      },
      builder: (context, state) {
        final isSignedIn = state is AuthSignedInState;

        return Scaffold(
          backgroundColor: isSignedIn
              ? colorScheme.secondary
              : colorScheme.onPrimaryFixedVariant,
          body: () {
            if (state is AuthInitialState ||
                state is AuthModeState ||
                state is AuthErrorState ||
                state is AuthLoadingState ||
                state is AuthSignedOutState) {
              return AuthForm(
                isLoading: state is AuthLoadingState,
                loginController: _loginController,
                passwordController: _passwordController,
                passwordAgainController: _passwordAgainController,
                loginError: state is AuthErrorState &&
                        state.error == AuthValidationError.loginRequired
                    ? l10.loginRequired
                    : null,
                passwordError: state is AuthErrorState &&
                        state.error == AuthValidationError.passwordRequired
                    ? l10.passwordRequired
                    : null,
                passwordAgainError: state is AuthErrorState &&
                        state.error == AuthValidationError.passwordAgainRequired
                    ? l10.passwordAgainRequired
                    : null,
                passwordsDoNotMatchError: state is AuthErrorState &&
                        state.error == AuthValidationError.passwordsDoNotMatch
                    ? l10.passwordsDoNotMatch
                    : null,
                passwordTooShortError: state is AuthErrorState &&
                        state.error == AuthValidationError.passwordTooShort
                    ? l10.passwordTooShort
                    : null,
                loginFailedError: state is AuthErrorState &&
                        state.error == AuthValidationError.loginFailed
                    ? l10.loginFailed
                    : null,
                registerFailedError: state is AuthErrorState &&
                        state.error == AuthValidationError.registerFailed
                    ? l10.registerFailed
                    : null,
                noInternetError: state is AuthErrorState &&
                        state.error == AuthValidationError.noInternet
                    ? l10.noInternet
                    : null,
                isSignIn: state.isSignIn,
                toggleAuthMode: toggleAuthMode,
                signInHandler: signInHandler,
                signUpHandler: signUpHandler,
              );
            }

            if (state is AuthSignedInState) {
              return ProfileForm(user: state.user);
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }(),
        );
      },
    );
  }
}
