import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';
import 'package:medic_pro_bloc/domain/subject/subject.dart';
import 'package:medic_pro_bloc/domain/subject/subject_failure.dart';
import 'package:rxdart/rxdart.dart' as rx_dart;


import '../../domain/subject/category.dart';
import '../../domain/subject/i_subject_repository.dart';

@LazySingleton(as: ISubjectRepository)
class SubjectRepository implements ISubjectRepository{

  final FirebaseFirestore _firestore;

  SubjectRepository(this._firestore);

  /// this generator returns plain Subject object
  /// to access its categories we need to call SubcategoryCollectionReference subcategoriesRef = subjectsRef.doc('myDocumentID').subcategories;
  @override
  Stream<Either<SubjectFailure, List<Subject>>> watchAll() async* {

    yield*  subjectsRef
        //snapshots() returns a stream of QuerySnapshot
        .snapshots()
        //list
        .map((snapshot){
          // to domain
          return right<SubjectFailure, List<Subject>>(
              snapshot.docs.map<Subject>((SubjectQueryDocumentSnapshot subjectQueryDocumentSnapshot){
                CategoryCollectionReference categoryCollectionReference = subjectsRef.doc(subjectQueryDocumentSnapshot.data.title).categories;
                var categories = categoryCollectionReference
                    .snapshots()
                    .map((snapshot){
                      return snapshot.docs.map<Category>((CategoryQueryDocumentSnapshot categoryQueryDocumentSnapshot){
                        return categoryQueryDocumentSnapshot.data;
                      }).toList();
                    });

                Subject completedSubject = subjectQueryDocumentSnapshot.data;
                // todo expecting big problem here
                completedSubject.categories = categories;

                return completedSubject;
                // used previously, outdated
                // return Subject.fromJson(doc.data() as Map<String, dynamic>);
            }).toList()
          );
        }).onErrorReturnWith((error, stackTrace) {
            print(error);
            print(stackTrace);
            // todo implement onError functionality and null check !
            if (error is FirebaseException && error.message!.contains('PERMISSION_DENIED')) {
                return left(const SubjectFailure.insufficientPermission());
            } else {
            return left(const SubjectFailure.unexpected());
            }
        });
  }
}