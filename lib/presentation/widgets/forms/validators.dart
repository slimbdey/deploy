class Validators {
  static String? emptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Это поле не может быть пустым';
    }

    return null;
  }
}
