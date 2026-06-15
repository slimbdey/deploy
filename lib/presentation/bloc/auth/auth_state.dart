import 'package:firebase_auth/firebase_auth.dart';

import 'utils.dart';

abstract class AuthState {
  final bool isSignIn;
  const AuthState({this.isSignIn = true});
}

class AuthInitialState extends AuthState {
  final String login;
  final String password;
  final String passwordAgain;

  const AuthInitialState(
      {this.login = '', this.password = '', this.passwordAgain = ''});
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState({super.isSignIn});
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState();
}

class AuthErrorState extends AuthState {
  final AuthValidationError error;

  const AuthErrorState({required this.error, super.isSignIn});
}

class AuthModeState extends AuthState {
  const AuthModeState({super.isSignIn});
}

class AuthSignedInState extends AuthState {
  final User user;
  const AuthSignedInState({required this.user});
}

class AuthSignedOutState extends AuthState {
  const AuthSignedOutState();
}
