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

                // fill subject with category
                Stream<List<Category>> categories = categoryCollectionReference
                    .snapshots()
                    .map((CategoryQuerySnapshot categoryQuerySnapshot){

                      return categoryQuerySnapshot.docs.map<Category>((CategoryQueryDocumentSnapshot categoryQueryDocumentSnapshot){

                        SubcategoryCollectionReference subcategoryCollectionReference = subjectsRef.doc(subjectQueryDocumentSnapshot.data.title).categories.doc(categoryQueryDocumentSnapshot.id).subcategories;

                        // fill category with subcategories
                        Stream<List<Subcategory>> subcategories = subcategoryCollectionReference
                          .snapshots()
                          .map((SubcategoryQuerySnapshot subcategoryQuerySnapshot){
                            return subcategoryQuerySnapshot.docs.map<Subcategory>((SubcategoryQueryDocumentSnapshot subcategoryQueryDocumentSnapshot){

                              // todo return completed subcategory
                              return subcategoryQueryDocumentSnapshot.data;
                            }).toList();
                          });

                        // return completed category
                        var completedCategory = categoryQueryDocumentSnapshot.data;
                        completedCategory.subcategories = subcategories;
                        return completedCategory;
                      }).toList();
                    });

                Subject completedSubject = subjectQueryDocumentSnapshot.data;
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