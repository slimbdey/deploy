abstract class AuthEvent {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final String login;
  final String password;

  const SignInEvent(this.login, this.password);
}

class SignUpEvent extends AuthEvent {
  final String login;
  final String password;
  final String passwordAgain;

  const SignUpEvent(this.login, this.password, this.passwordAgain);
}

class SignOutEvent extends AuthEvent {
  const SignOutEvent();
}

class ToggleAuthModeEvent extends AuthEvent {
  const ToggleAuthModeEvent();
}
