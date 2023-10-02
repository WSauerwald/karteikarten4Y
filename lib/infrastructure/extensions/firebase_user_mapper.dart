import 'package:firebase_auth/firebase_auth.dart';
import 'package:karteikarten/domain/entities/id.dart';
import 'package:karteikarten/domain/entities/user_entity.dart';

extension FirebaseUserMapper on User {
  UserEntity toDomain() {
    return UserEntity(id: UniqueID.fromUniqueString(uid));
  }
}