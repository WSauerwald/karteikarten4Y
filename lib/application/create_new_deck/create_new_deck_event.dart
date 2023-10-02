part of 'create_new_deck_bloc.dart';

@immutable
sealed class CreateNewDeckEvent {}

class CreateNewDeckPressed extends CreateNewDeckEvent{
  final String deckName;
  CreateNewDeckPressed({required this.deckName});
}
