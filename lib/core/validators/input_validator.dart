

String? validateInput(String? input) {
  if (input == null || input.isEmpty) {
    return "must not be empty";
  }  else {
    return null;
  }
}