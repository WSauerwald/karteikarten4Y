part of 'controller_bloc.dart';

@immutable
sealed class ControllerState {}

final class ControllerInitial extends ControllerState {}

final class ControllerInProgress extends ControllerState {}

final class ControllerSuccess extends ControllerState {}

final class ControllerFailure extends ControllerState {
  final DeckFailure deckFailure;
  ControllerFailure({required this.deckFailure});
}
