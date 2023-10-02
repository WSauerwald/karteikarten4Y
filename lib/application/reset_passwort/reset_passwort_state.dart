part of 'reset_passwort_bloc.dart';

@immutable
sealed class ResetPasswortState {}

final class ResetPasswortStateInit extends ResetPasswortState {}

final class ResetPasswortStateLoading extends ResetPasswortState {}

final class ResetPasswortStateLoaded extends ResetPasswortState {
  final String message;
  ResetPasswortStateLoaded({required this.message});
}

final class ResetPasswortStateError extends ResetPasswortState {
  final String message;
  ResetPasswortStateError({required this.message});
}