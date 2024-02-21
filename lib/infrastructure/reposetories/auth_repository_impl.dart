import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karteikarten/core/failures/auth_failures.dart';
import 'package:karteikarten/domain/entities/user_entity.dart';
import 'package:karteikarten/domain/reposetories/auth_repository.dart';
import 'package:karteikarten/infrastructure/extensions/firebase_user_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return left(EmailAlreadyInUseFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signinWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password" || e.code == "user-not-found") {
        return left(InvalidEmailAndPasswordFailure());
      } else if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        return left(InvalidEmailAndPasswordFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> resetPasswort(
      {required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == "auth/user-not-found") {
        return left(NoCorrespondingEmailFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Option<UserEntity> getSignedInUser() =>
      optionOf(firebaseAuth.currentUser?.toDomain());

  @override
  Future<void> signOut() => Future.wait([firebaseAuth.signOut()]);
  
  
}
