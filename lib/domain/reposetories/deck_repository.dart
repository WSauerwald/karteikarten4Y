

import 'package:dartz/dartz.dart';
import 'package:karteikarten/core/failures/deck_failures.dart';
import 'package:karteikarten/domain/entities/deck_entity.dart';

abstract class DeckRepository{
  Stream<Either<DeckFailure, List<DeckEntity>>> watchAll();

  Future<Either<DeckFailure, Unit>> create(DeckEntity deckEntity);

  Future<Either<DeckFailure, Unit>> update(DeckEntity deckEntity);

  Future<Either<DeckFailure, Unit>> delete(DeckEntity deckEntity);
}