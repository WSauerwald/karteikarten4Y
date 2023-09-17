part of 'signup_bloc.dart';

@immutable
sealed class SignupBlocEvent {}

class RegisterWithEmailAndPasswordPressed extends SignupBlocEvent{
  final String email;
  final String password;
  RegisterWithEmailAndPasswordPressed({required this.email, required this.password});
}

class LoginWithEmailAndPasswordPressed extends SignupBlocEvent{
  final String email;
  final String password;
  LoginWithEmailAndPasswordPressed({required this.email, required this.password});
}


class LoginRequestedEvent extends SignupBlocEvent{}