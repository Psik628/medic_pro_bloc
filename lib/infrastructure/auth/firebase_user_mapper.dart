import 'package:firebase_auth/firebase_auth.dart' as Firebase;

import '../../domain/auth/user.dart';

extension FirebaseDomainX on Firebase.User{
  User toDomain(){
    return User(id: uid);
  }
}