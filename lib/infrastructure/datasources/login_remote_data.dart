import 'package:firebase_auth/firebase_auth.dart';
import 'package:karteikarten/domain/entities/user_entity.dart';

import 'package:http/http.dart' as http;
import 'package:karteikarten/service/firebase.dart';


abstract class LoginRemoteDatasource{
  Future<UserEntity> verificationFromAPI();
}

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource{
  final http.Client client;
  LoginRemoteDatasourceImpl({required this.client});

  final User? user = Firebase().currentUser;

  @override
  Future<UserEntity> verificationFromAPI() async {
    return UserEntity(userName: "t", email: "f", password: "f");//response = await client.
  }

}