import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:karteikarten/application/signup/signup_bloc.dart';
import 'package:karteikarten/domain/reposetories/auth_repository.dart';
import 'package:karteikarten/infrastructure/reposetories/auth_repository_impl.dart';

final serviceLocator = GetIt.I;

Future<void> init() async{

  //! state management
  serviceLocator.registerFactory(() => SignupBloc(authRepository: serviceLocator()));

  //! repos
  serviceLocator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(firebaseAuth: serviceLocator()));

  //! extern
  final firebaseAuth = FirebaseAuth.instance;
  serviceLocator.registerLazySingleton(() => firebaseAuth);

}