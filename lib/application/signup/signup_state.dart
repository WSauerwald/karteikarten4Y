part of 'signup_bloc.dart';


class SignupState {
  final bool isSubmitting;
  final bool showValidationMessage;
  final Option<Either<AuthFailure, Unit>> authFailuresOrSuccessOption;
  SignupState({required this.isSubmitting, required this.showValidationMessage, required this.authFailuresOrSuccessOption});

  SignupState copyWith({
    bool? isSubmitting,
    bool? showValidationMessage,
    Option<Either<AuthFailure, Unit>>? authFailuresOrSuccessOption,
  }){
    return SignupState(
      isSubmitting: isSubmitting ?? this.isSubmitting, 
      showValidationMessage: showValidationMessage ?? this.showValidationMessage, 
      authFailuresOrSuccessOption: authFailuresOrSuccessOption?? this.authFailuresOrSuccessOption);
  }
}


