import 'package:bloc/bloc.dart';
import 'package:karteikarten/domain/reposetories/deck_repository.dart';
import 'package:meta/meta.dart';

part 'create_new_deck_event.dart';
part 'create_new_deck_state.dart';

class CreateNewDeckBloc extends Bloc<CreateNewDeckEvent, CreateNewDeckState> {
  final DeckRepository deckRepository;
  CreateNewDeckBloc({required this.deckRepository}) : super(CreateNewDeckInitial()) {
    
    
    on<CreateNewDeckPressed>((event, emit) {
      emit(CreateNewDeckLoading());

      
      
    });
  }
}
