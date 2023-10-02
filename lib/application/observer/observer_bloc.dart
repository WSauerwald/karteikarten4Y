import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:karteikarten/core/failures/deck_failures.dart';
import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/domain/reposetories/deck_repository.dart';
import 'package:meta/meta.dart';

part 'observer_event.dart';
part 'observer_state.dart';

class ObserverBloc extends Bloc<ObserverEvent, ObserverState> {
  final DeckRepository deckRepository;

  StreamSubscription<Either<DeckFailure, List<DeckEntity>>>? _deckStreamSub;
  ObserverBloc({required this.deckRepository}) : super(ObserverInitial()) {


    on<ObserverAllEvent>((event, emit) async {

      emit(ObserverLoading());

      await _deckStreamSub?.cancel();
      _deckStreamSub = deckRepository.watchAll().listen((failureOrDecks) => add(DeckUpdatedEvent(failureOrDecks: failureOrDecks)));
    });

    on<DeckUpdatedEvent>((event, emit) {
      event.failureOrDecks.fold(
        (failure) => emit(ObserverFailure(deckFailure: failure)), 
        (decks) => emit(ObserverSuccess(deckEntity: decks)));
    });

    @override
    Future<void> close() async {
    await _deckStreamSub?.cancel();
    return super.close();
  }

  }
}
