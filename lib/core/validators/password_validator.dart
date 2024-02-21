String? validatePassword(String? input) {
  if (input == null || input.isEmpty) {
    return "please enter a valid passwort";
  } else if (input.length >= 6) {
    return null;
  } else {
    return "short password";
  }
}
