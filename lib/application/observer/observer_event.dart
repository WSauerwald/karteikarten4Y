part of 'observer_bloc.dart';

@immutable
sealed class ObserverEvent {}

class ObserverAllEvent extends ObserverEvent{}

class DeckUpdatedEvent extends ObserverEvent{
  final Either<DeckFailure, List<DeckEntity>> failureOrDecks;
  DeckUpdatedEvent({required this.failureOrDecks});
}
