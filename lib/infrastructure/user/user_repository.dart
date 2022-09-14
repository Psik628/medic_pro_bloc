import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/user/user.dart' as Entity;

import '../../domain/user/answered_question_section.dart';
import '../../domain/user/i_user_repository.dart';
import '../../domain/user/user.dart';
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
  Stream<Either<UserFailure, Entity.User>> watchProfileById(String id) async* {
    // todo pass email above
    yield* usersRef
        .doc(id)
        .snapshots()
        .map((UserDocumentSnapshot userDocumentSnapshot){

          AnsweredQuestionSectionCollectionReference answeredQuestionSectionReferenceCollectionReference = usersRef.doc(id).answeredquestionsections;

          Stream<List<AnsweredQuestionSection>> answeredQuestionSectionReferences = answeredQuestionSectionReferenceCollectionReference
            .snapshots()
            .map((AnsweredQuestionSectionQuerySnapshot answeredQuestionSectionQuerySnapshot){
              return answeredQuestionSectionQuerySnapshot.docs.map<AnsweredQuestionSection>((AnsweredQuestionSectionQueryDocumentSnapshot answeredQuestionSectionReferenceQueryDocumentSnapshot){
                return answeredQuestionSectionReferenceQueryDocumentSnapshot.data;
              }).toList();
          });

          // todo solve null value
          User userToBeCompleted = userDocumentSnapshot.data!;

          userToBeCompleted.answeredQuestionSections = answeredQuestionSectionReferences;
          // return completed user
          return right<UserFailure, Entity.User>(
              userToBeCompleted
          );
        });
  }
}