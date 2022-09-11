import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/user/answered_question_section.dart';
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


  // todo return only user not user list
  @override
  Stream<Either<UserFailure, List<Entity.User>>> watchProfile() async* {

    yield* usersRef
        .snapshots()
        .map((snapshot){
          return right<UserFailure, List<Entity.User>>(
              snapshot.docs.map<Entity.User>((UserQueryDocumentSnapshot userQueryDocumentSnapshot){

                AnsweredQuestionSectionCollectionReference answeredQuestionSectionReferenceCollectionReference = usersRef.doc(userQueryDocumentSnapshot.id).answeredquestionsections;

                // fill user with answered question sections
                Stream<List<AnsweredQuestionSection>> answeredQuestionSectionReferences = answeredQuestionSectionReferenceCollectionReference
                  .snapshots()
                  .map((AnsweredQuestionSectionQuerySnapshot answeredQuestionSectionReferenceQuerySnapshot){
                    return answeredQuestionSectionReferenceQuerySnapshot.docs.map<AnsweredQuestionSection>((AnsweredQuestionSectionQueryDocumentSnapshot answeredQuestionSectionReferenceQueryDocumentSnapshot){
                      return answeredQuestionSectionReferenceQueryDocumentSnapshot.data;
                    }).toList();
                  });

                User completedUser = userQueryDocumentSnapshot.data;

                completedUser.answeredQuestionSections = answeredQuestionSectionReferences;

                return userQueryDocumentSnapshot.data;
              }).toList()
          );
        });
  }
}