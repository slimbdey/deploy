import 'package:flutter/material.dart';
import 'package:hw/presentation/l10n/app_localizations.dart';
import 'package:hw/presentation/widgets/form_submit_button.dart';
import 'package:hw/presentation/widgets/login_input.dart';
import 'package:hw/presentation/widgets/navigation/top_bar.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController loginController;
  final TextEditingController passwordController;
  final TextEditingController passwordAgainController;
  final String? loginError;
  final String? passwordError;
  final String? passwordAgainError;
  final String? passwordsDoNotMatchError;
  final String? passwordTooShortError;
  final String? loginFailedError;
  final String? registerFailedError;
  final String? noInternetError;
  final bool isSignIn;
  final bool isLoading;
  final Function() toggleAuthMode;
  final Function() signInHandler;
  final Function() signUpHandler;

  const AuthForm(
      {super.key,
      required this.loginController,
      required this.passwordController,
      required this.passwordAgainController,
      this.loginError,
      this.passwordError,
      this.passwordAgainError,
      this.passwordsDoNotMatchError,
      this.passwordTooShortError,
      this.loginFailedError,
      this.registerFailedError,
      this.noInternetError,
      required this.isSignIn,
      required this.isLoading,
      required this.toggleAuthMode,
      required this.signInHandler,
      required this.signUpHandler});

  void nullHandler(String value) {}

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context)!;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TopBar(hideSignOut: true),
                    const SizedBox(height: 60),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Otus.Food',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              spacing: 16,
                              children: [
                                LoginInput(
                                    isLoading: isLoading,
                                    autoFocus: true,
                                    controller: loginController,
                                    errorText: loginError,
                                    label: l10.login,
                                    onChanged: nullHandler),
                                LoginInput(
                                    isLoading: isLoading,
                                    controller: passwordController,
                                    errorText: passwordError ??
                                        passwordTooShortError ??
                                        registerFailedError ??
                                        loginFailedError ??
                                        noInternetError,
                                    label: l10.password,
                                    onChanged: nullHandler),
                                if (!isSignIn)
                                  LoginInput(
                                      isLoading: isLoading,
                                      controller: passwordAgainController,
                                      errorText: passwordAgainError ??
                                          passwordsDoNotMatchError,
                                      label: l10.passwordAgain,
                                      onChanged: nullHandler),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          FormSubmitButton(
                            isLoading: isLoading,
                            isOutlined: false,
                            label: isSignIn ? l10.signIn : l10.signUp,
                            onPressed: isSignIn ? signInHandler : signUpHandler,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                        onPressed: isLoading ? null : toggleAuthMode,
                        child:
                            Text(isSignIn ? l10.signUpLabel : l10.signInLabel)),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
