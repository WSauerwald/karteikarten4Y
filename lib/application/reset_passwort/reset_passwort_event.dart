part of 'reset_passwort_bloc.dart';

@immutable
sealed class ResetPasswortEvent {}

class ForgottenPasswordPressed extends ResetPasswortEvent{
  final String email;
  ForgottenPasswordPressed({required this.email});
}
