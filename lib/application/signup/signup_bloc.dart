import 'package:bloc/bloc.dart';
import 'package:karteikarten/domain/failures/failure.dart';
import 'package:karteikarten/domain/use_cases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupBlocEvent, SignupState> {
  SignupBloc() : super(SignupState(isSubmitting: false, showValidationMessage: false)) {
    
    on<RegisterWithEmailAndPasswordPressed>((event, emit){

    });

    on<LoginWithEmailAndPasswordPressed>((event, emit) {
      
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
