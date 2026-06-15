import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw/domain/interfaces/i_login_service.dart';

import 'auth_event.dart';
import 'auth_state.dart';
import 'utils.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ILoginService _loginService;

  AuthBloc(this._loginService) : super(const AuthInitialState()) {
    on<SignInEvent>((event, emit) async {
      emit(AuthLoadingState(isSignIn: state.isSignIn));

      try {
        AuthUtils.validateForm(event.login, event.password, null);

        final user = await _loginService.signInWithLoginPassword(
            event.login, event.password);
        if (user == null) {
          throw Exception();
        }

        emit(AuthSignedInState(user: user));
      } catch (e) {
        if (e is AuthValidationError) {
          return emit(AuthErrorState(error: e, isSignIn: state.isSignIn));
        }

        return emit(AuthErrorState(
            error: AuthValidationError.loginFailed, isSignIn: state.isSignIn));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoadingState(isSignIn: state.isSignIn));

      try {
        AuthUtils.validateForm(
            event.login, event.password, event.passwordAgain);

        final user = await _loginService.registerWithLoginPassword(
            event.login, event.password);
        if (user == null) {
          throw Exception();
        }

        emit(AuthSignedInState(user: user));
      } catch (e) {
        if (e is AuthValidationError) {
          return emit(AuthErrorState(error: e, isSignIn: state.isSignIn));
        }

        return emit(AuthErrorState(
            error: AuthValidationError.registerFailed,
            isSignIn: state.isSignIn));
      }
    });

    on<ToggleAuthModeEvent>((event, emit) {
      emit(AuthModeState(isSignIn: !state.isSignIn));
    });

    on<SignOutEvent>((event, emit) async {
      await _loginService.signOut();
      emit(AuthSignedOutState());
    });
  }
}
