

import 'package:dartz/dartz.dart';
import 'package:karteikarten/domain/entities/user_entity.dart';
import 'package:karteikarten/domain/failures/failure.dart';
import 'package:karteikarten/domain/reposetories/login_reposetory.dart';

class LoginUsecase {
  final LoginReposetory loginReposetory;
  LoginUsecase({required this.loginReposetory});
  
 Future <Either<Failure, UserEntity>> sendCall() async{
  return loginReposetory.loginToAPI();
 }
}