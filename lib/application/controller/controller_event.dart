part of 'controller_bloc.dart';

@immutable
sealed class ControllerEvent {}

class DeleteDeckEvent extends ControllerEvent {
  final DeckEntity deckEntity;
  DeleteDeckEvent({required this.deckEntity});
}

class UpdateDeckEvent extends ControllerEvent {
  final DeckEntity deckEntity;
  UpdateDeckEvent({required this.deckEntity});
}

class CreateDeckEvent extends ControllerEvent {
  final DeckEntity deckEntity;
  CreateDeckEvent({required this.deckEntity});
}