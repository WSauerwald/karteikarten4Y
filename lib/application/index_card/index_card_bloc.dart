import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'index_card_event.dart';
part 'index_card_state.dart';

class IndexCardBloc extends Bloc<IndexCardEvent, IndexCardState> {
  IndexCardBloc() : super(IndexCardInitial()) {
    on<IndexCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
