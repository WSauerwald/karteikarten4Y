import 'package:karteikarten/core/failures/auth_failures.dart';
import 'package:karteikarten/core/failures/deck_failures.dart';

String mapAuthFailureMessage(AuthFailure failure) {
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

String mapDeckFailureToMessage(DeckFailure deckFailure) {
  switch (deckFailure.runtimeType) {
    case InsufficientPermisssons:
      return "You have not the permission to do that";
    case UnexpectedFailure:
      return "Something went wrong";
    case ContainsNotFoundFailure:
      return "Not Found sry";
    default:
      return "Something went wrong";
  }
}
