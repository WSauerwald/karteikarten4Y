part of 'observer_bloc.dart';

@immutable
sealed class ObserverState {}

final class ObserverInitial extends ObserverState {}

class ObserverLoading extends ObserverState {}

class ObserverFailure extends ObserverState {
  final DeckFailure deckFailure;
  ObserverFailure({required this.deckFailure});
}

class ObserverSuccess extends ObserverState {
  final List<DeckEntity> deckEntity;
  ObserverSuccess({required this.deckEntity});
}
