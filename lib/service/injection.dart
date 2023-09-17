import 'package:get_it/get_it.dart';
import 'package:karteikarten/application/signup/signup_bloc.dart';

final serviceLocator = GetIt.I;

Future<void> init() async{

  //! state management
  serviceLocator.registerFactory(() => SignupBloc());
}