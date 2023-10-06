import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:karteikarten/application/auth/auth_bloc.dart';
import 'package:karteikarten/application/controller/controller_bloc.dart';
import 'package:karteikarten/application/observer/observer_bloc.dart';
import 'package:karteikarten/application/reset_passwort/reset_passwort_bloc.dart';
import 'package:karteikarten/application/signup/signup_bloc.dart';
import 'package:karteikarten/domain/reposetories/auth_repository.dart';
import 'package:karteikarten/domain/reposetories/deck_repository.dart';
import 'package:karteikarten/infrastructure/reposetories/auth_repository_impl.dart';
import 'package:karteikarten/infrastructure/reposetories/deck_repository_impl.dart';

final serviceLocator = GetIt.I;

Future<void> init() async{

  //! state management
  serviceLocator.registerFactory(() => ResetPasswortBloc(authRepository: serviceLocator()));
  serviceLocator.registerFactory(() => SignupBloc(authRepository: serviceLocator()));
  serviceLocator.registerFactory(() => AuthBloc(authRepository: serviceLocator()));
  serviceLocator.registerFactory(() => ObserverBloc(deckRepository: serviceLocator()));
  serviceLocator.registerFactory(() => ControllerBloc(deckRepository: serviceLocator()));

  //! repos
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(firebaseAuth: serviceLocator()));
  serviceLocator.registerLazySingleton<DeckRepository>(() => DeckRepositoryImpl(firebaseFirestore: serviceLocator()));


  //! extern
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  serviceLocator.registerLazySingleton(() => firebaseAuth);
  serviceLocator.registerLazySingleton(() => firestore);

}