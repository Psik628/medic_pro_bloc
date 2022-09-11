import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/user/user.dart' as Entity;
import 'package:medic_pro_bloc/domain/user/user.dart';

import '../../domain/user/i_user_repository.dart';
import '../../domain/user/user_failure.dart';

/*
todo rename this thing to user repo, and return user with answered question sections
 */


@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository{

  final FirebaseFirestore _firestore;

  UserRepository(this._firestore);

  @override
  Stream<Either<UserFailure, List<Entity.User>>> watchProfile() async* {

    yield* usersRef
        .snapshots()
        .map((snapshot){
          return right<UserFailure, List<Entity.User>>(
              snapshot.docs.map<Entity.User>((UserQueryDocumentSnapshot userQueryDocumentSnapshot){
                return userQueryDocumentSnapshot.data;
              }).toList()
          );
        });
  }
}