import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../domain/core/errors.dart';
import '../../injection.dart';


extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final currentUser = getIt<IAuthFacade>().getCurrentUser();
    if(currentUser == null) throw NotAuthenticatedError();
    return FirebaseFirestore.instance
        .collection('users') // todo extract to constant
        .doc(currentUser.id);
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get subjectCollection => collection('subjects'); // todo extract to constant
}
