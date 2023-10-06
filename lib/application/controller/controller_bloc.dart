import 'package:bloc/bloc.dart';
import 'package:karteikarten/core/failures/deck_failures.dart';
import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/domain/reposetories/deck_repository.dart';
import 'package:meta/meta.dart';

part 'controller_event.dart';
part 'controller_state.dart';

class ControllerBloc extends Bloc<ControllerEvent, ControllerState> {
  final DeckRepository deckRepository;
  ControllerBloc({required this.deckRepository}) : super(ControllerInitial())  {

    on<DeleteDeckEvent>((event, emit) async {
      emit(ControllerInProgress());

      final failureOrSuccess = await deckRepository.delete(event.deckEntity);

      failureOrSuccess.fold(
        (failure) => emit(ControllerFailure(deckFailure: failure)), 
        (r) => emit(ControllerSuccess()));
    });

    on<UpdateDeckEvent>((event, emit) async {
      emit(ControllerInProgress());

      final failureOrSuccess = await deckRepository.update(event.deckEntity);

      failureOrSuccess.fold(
        (failure) => emit(ControllerFailure(deckFailure: failure)), 
        (r) => emit(ControllerSuccess()));
    });

    on<CreateDeckEvent>((event, emit) async {
      emit(ControllerInProgress());

      final failureOrSuccess = await deckRepository.create(event.deckEntity);

      failureOrSuccess.fold(
        (failure) => emit(ControllerFailure(deckFailure: failure)), 
        (r) => emit(ControllerSuccess()));
    });
  }  
}
