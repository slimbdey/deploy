enum AuthValidationError {
  loginRequired,
  passwordRequired,
  passwordTooShort,
  passwordAgainRequired,
  passwordsDoNotMatch,
  loginFailed,
  registerFailed,
  noInternet,
}

class AuthUtils {
  static void validateForm(
    String login,
    String password,
    String? passwordAgain,
  ) {
    if (login.isEmpty) {
      throw AuthValidationError.loginRequired;
    }
    if (password.isEmpty) {
      throw AuthValidationError.passwordRequired;
    }
    if (password.length < 6) {
      throw AuthValidationError.passwordTooShort;
    }
    if (passwordAgain != null && passwordAgain.isEmpty) {
      throw AuthValidationError.passwordAgainRequired;
    }
    if (passwordAgain != null && passwordAgain != password) {
      throw AuthValidationError.passwordsDoNotMatch;
    }
  }
}
