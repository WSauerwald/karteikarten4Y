import 'package:bloc/bloc.dart';
import 'package:karteikarten/core/failures/map/map_failures.dart';
import 'package:karteikarten/domain/reposetories/auth_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'reset_passwort_event.dart';
part 'reset_passwort_state.dart';




class ResetPasswortBloc extends Bloc<ResetPasswortEvent, ResetPasswortState> {
  final AuthRepository authRepository;
  ResetPasswortBloc({required this.authRepository})
      : super(ResetPasswortStateInit()) {
    on<ForgottenPasswordPressed>((event, emit) async {
      emit(ResetPasswortStateLoading());

      final failureOrSuccess =
          await authRepository.resetPasswort(email: event.email);

      failureOrSuccess.fold(
        (failuer) => emit(
            ResetPasswortStateError(message: mapAuthFailureMessage(failuer))),
        (success) => emit(ResetPasswortStateLoaded(message: "Email send")),
      );
    });
  }
}
