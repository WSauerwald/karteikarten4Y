import 'package:dartz/dartz.dart';
import 'package:karteikarten/core/failures/auth_failures.dart';
import 'package:karteikarten/domain/entities/user_entity.dart';

abstract class AuthRepository{

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({required String email, required String password});

  Future<Either<AuthFailure, Unit>> signinWithEmailAndPassword({required String email, required String password});

  Future<Either<AuthFailure, Unit>> resetPasswort({required String email});

  Future<void> signOut();

  Option<UserEntity> getSignedInUser();
}