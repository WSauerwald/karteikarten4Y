

String? validateEmail(String? input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (input == null || input.isEmpty) {
    return "please enter email";
  } else if (RegExp(emailRegex).hasMatch(input)) {
    return null;
  } else {
    return "invalid email format";
  }
}