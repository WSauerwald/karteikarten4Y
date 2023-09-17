import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_new_card_event.dart';
part 'create_new_card_state.dart';

class CreateNewCardBlocBloc extends Bloc<CreateNewCardBlocEvent, CreateNewCardBlocState> {
  CreateNewCardBlocBloc() : super(CreateNewCardBlocInitial()) {
    on<CreateNewCardBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
