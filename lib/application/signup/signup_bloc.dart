import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:karteikarten/core/failures/auth_failures.dart';
import 'package:karteikarten/domain/reposetories/auth_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupBlocEvent, SignupState> {
  final AuthRepository authRepository;
  SignupBloc({required this.authRepository}) : super(SignupState(isSubmitting: false, showValidationMessage: false, authFailuresOrSuccessOption: none())) {
    
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, showValidationMessage: false));

      final failureOrSuccess = await authRepository.registerWithEmailAndPassword(email: event.email, password: event.password);

      emit(SignupState(isSubmitting: false, showValidationMessage: false, authFailuresOrSuccessOption: optionOf(failureOrSuccess)));
    });

    on<LoginWithEmailAndPasswordPressed>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, showValidationMessage: false));

      final failureOrSuccess = await authRepository.signinWithEmailAndPassword(email: event.email, password: event.password);

      emit(SignupState(isSubmitting: false, showValidationMessage: false, authFailuresOrSuccessOption: optionOf(failureOrSuccess)));
    });
  }
}