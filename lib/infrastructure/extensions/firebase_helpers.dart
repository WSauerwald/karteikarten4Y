import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karteikarten/core/errors/errors.dart';
import 'package:karteikarten/domain/reposetories/auth_repository.dart';
import 'package:karteikarten/service/injection.dart';

extension FirestoreExt on FirebaseFirestore {

  Future<DocumentReference> userDocument() async {
    final userOption = serviceLocator<AuthRepository>().getSignedInUser();

    final user = userOption.getOrElse(() => throw NotAuthenticatedError());

    return FirebaseFirestore.instance.collection("users").doc(user.id.value);
  }
}

extension DocumentReferenceExt on DocumentReference{
  CollectionReference<Map<String,dynamic>> get deckCollection => collection("decks");
}
