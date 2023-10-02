

String? validatePassword(String? input) {
  if (input == null || input.isEmpty) {
    return "please enter email";
  } else if (input.length >= 6) {
    return null;
  } else {
    return "short password";
  }
}