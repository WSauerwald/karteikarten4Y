import 'package:dartz/dartz.dart';
import 'package:karteikarten/domain/entities/user_entity.dart';
import 'package:karteikarten/domain/failures/failure.dart';

abstract class LoginReposetory{
  Future <Either<Failure, UserEntity>> loginToAPI();
}