import 'package:bloc/bloc.dart';
import 'package:karteikarten/domain/failures/failure.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupBlocEvent, SignupState> {
  SignupBloc() : super(SignupState(isSubmitting: false, showValidationMessage: false)) {
    
    on<RegisterWithEmailAndPasswordPressed>((event, emit){
      emit(SignupState(isSubmitting: true, showValidationMessage: false));
    });

    on<LoginWithEmailAndPasswordPressed>((event, emit) {
      emit(SignupState(isSubmitting: true, showValidationMessage: false));
    });
  }
}

 String _mapFailuerToMessage(Failure failuer){
    switch(failuer.runtimeType){
      case ServerFailure:
        return "Ups API Error, please try again!";
      case GeneralFailure:
        return "Ups, something gone wrong, please try again";
      default:
        return "Ups, something gone wrong, please try again";
    }
  }
