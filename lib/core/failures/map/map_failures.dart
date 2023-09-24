import 'package:karteikarten/core/failures/auth_failures.dart';

String mapFailureMessage(AuthFailure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server failure. Please try agan!";
      case EmailAlreadyInUseFailure:
        return "Email already in use";
      case InvalidEmailAndPasswordFailure:
        return "Invalid email or password";
      case NoCorrespondingEmailFailure:
        return "There is no user corresponding to the email address";
      default:
        return "Something went wrong";
    }
  }