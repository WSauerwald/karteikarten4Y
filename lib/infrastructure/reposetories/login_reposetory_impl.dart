import 'package:dartz/dartz.dart';
import 'package:karteikarten/domain/entities/user_entity.dart';
import 'package:karteikarten/domain/failures/failure.dart';
import 'package:karteikarten/domain/reposetories/login_reposetory.dart';
import 'package:karteikarten/infrastructure/datasources/login_remote_data.dart';
import 'package:karteikarten/infrastructure/exceptions/exception.dart';

class LoginReposetoryImpl implements LoginReposetory{
  final LoginRemoteDatasource loginRemoteDatasource;
  LoginReposetoryImpl({required this.loginRemoteDatasource});

  @override
  Future<Either<Failure, UserEntity>> loginToAPI() async {
    try{
      final verification = await loginRemoteDatasource.verificationFromAPI();
      return Right(verification);
    }
    catch(e){
      if(e.runtimeType is ServerException){
        return left(ServerFailure());
      }
      else{
        return left(GeneralFailure());
      }
    }
  }

}