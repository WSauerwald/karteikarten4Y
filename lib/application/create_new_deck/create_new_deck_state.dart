part of 'create_new_deck_bloc.dart';

@immutable
sealed class CreateNewDeckState {}

final class CreateNewDeckInitial extends CreateNewDeckState {}

final class CreateNewDeckLoading extends CreateNewDeckState {}

final class CreateNewDeckLoaded extends CreateNewDeckState {
  final String message;
  CreateNewDeckLoaded({required this.message});
}

final class CreateNewDeckError extends CreateNewDeckState {
  final String message;
  CreateNewDeckError({required this.message});
}
