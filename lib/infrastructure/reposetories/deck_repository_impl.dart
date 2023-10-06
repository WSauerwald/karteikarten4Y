import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:karteikarten/core/failures/deck_failures.dart';
import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/domain/reposetories/deck_repository.dart';
import 'package:karteikarten/infrastructure/extensions/firebase_helpers.dart';
import 'package:karteikarten/infrastructure/models/deck_model.dart';

class DeckRepositoryImpl implements DeckRepository {
  final FirebaseFirestore firebaseFirestore;
  DeckRepositoryImpl({required this.firebaseFirestore});

  @override
  Future<Either<DeckFailure, Unit>> create(DeckEntity deckEntity) async {
    try {
      final userDoc = await firebaseFirestore.userDocument();
      final deckmodel = DeckModel.fromDomain(deckEntity);

      await userDoc.deckCollection.doc(deckmodel.id).set(deckmodel.toMap());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code.contains('PERMISSION_DENIED')) {
        return left(InsufficientPermisssons());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }

  @override
  Future<Either<DeckFailure, Unit>> delete(DeckEntity deckEntity) async {
    try {
      final userDoc = await firebaseFirestore.userDocument();
      final deckmodel = DeckModel.fromDomain(deckEntity);

      await userDoc.deckCollection.doc(deckmodel.id).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code.contains('PERMISSION_DENIED')) {
        return left(InsufficientPermisssons());
      } else if (e.code.contains('CONTAINS_NOT_FOUND')) {
        return left(ContainsNotFoundFailure());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }

  @override
  Future<Either<DeckFailure, Unit>> update(DeckEntity deckEntity) async {
    try {
      final userDoc = await firebaseFirestore.userDocument();
      final deckmodel = DeckModel.fromDomain(deckEntity);

      await userDoc.deckCollection.doc(deckmodel.id).update(deckmodel.toMap());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code.contains('PERMISSION_DENIED')) {
        return left(InsufficientPermisssons());
      } else if (e.code.contains('CONTAINS_NOT_FOUND')) {
        return left(ContainsNotFoundFailure());
      } else {
        return left(UnexpectedFailure());
      }
    }
  }

  @override
  Stream<Either<DeckFailure, List<DeckEntity>>> watchAll() async* {
    final userDoc = await firebaseFirestore.userDocument();

    yield* userDoc.deckCollection
        .snapshots()
        .map((snapshots) => right<DeckFailure, List<DeckEntity>>(snapshots.docs
            .map((doc) => DeckModel.fromFirestore(doc).toDomain())
            .toList()))
        .handleError((e) {
      if (e is FirebaseException) {
        if (e.code.contains('permission-denied') ||
            e.code.contains('PERMISSION_DENIED')) {
          return left(InsufficientPermisssons());
        } else {
          return left(UnexpectedFailure());
        }
      } else {
        return left(UnexpectedFailure());
      }
    });
  }
}
