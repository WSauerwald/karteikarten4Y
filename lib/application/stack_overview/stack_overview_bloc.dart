import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stack_overview_event.dart';
part 'stack_overview_state.dart';

class StackOverviewBloc extends Bloc<StackOverviewEvent, StackOverviewState> {
  StackOverviewBloc() : super(StackOverviewInitial()) {
    on<StackOverviewEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
