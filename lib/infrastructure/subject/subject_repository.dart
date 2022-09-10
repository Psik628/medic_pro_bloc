import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/animation.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';
import 'package:medic_pro_bloc/domain/subject/questionsection.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';
import 'package:medic_pro_bloc/domain/subject/subject.dart';
import 'package:medic_pro_bloc/domain/subject/subject_failure.dart';
import 'package:rxdart/rxdart.dart' as rx_dart;


import '../../domain/subject/article.dart';
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

                              ArticleCollectionReference articleCollectionReference = subjectsRef.doc(subjectQueryDocumentSnapshot.data.title).categories.doc(categoryQueryDocumentSnapshot.id).subcategories.doc(subcategoryQueryDocumentSnapshot.id).articles;

                              // fill subcategory with articles
                              Stream<List<Article>> articles = articleCollectionReference
                                .snapshots()
                                .map((ArticleQuerySnapshot articleQuerySnapshot){
                                  return articleQuerySnapshot.docs.map<Article>((ArticleQueryDocumentSnapshot articleQueryDocumentSnapshot){
                                    return articleQueryDocumentSnapshot.data;
                                  }).toList();
                                });

                              QuestionSectionCollectionReference questionSectionCollectionReference = subjectsRef.doc(subjectQueryDocumentSnapshot.data.title).categories.doc(categoryQueryDocumentSnapshot.id).subcategories.doc(subcategoryQueryDocumentSnapshot.id).questionsections;

                              // fill subcategory with question sections
                              Stream<List<QuestionSection>> questionSections = questionSectionCollectionReference
                                  .snapshots()
                                  .map((QuestionSectionQuerySnapshot questionSectionQuerySnapshot){
                                    return questionSectionQuerySnapshot.docs.map<QuestionSection>((QuestionSectionQueryDocumentSnapshot questionSectionQueryDocumentSnapshot){
                                    // fill question section with questions
                                    QuestionCollectionReference questionCollectionReference = subjectsRef.doc(subjectQueryDocumentSnapshot.data.title).categories.doc(categoryQueryDocumentSnapshot.id).subcategories.doc(subcategoryQueryDocumentSnapshot.id).questionsections.doc(questionSectionQueryDocumentSnapshot.id).questions;
                                    Stream<List<Question>> questions = questionCollectionReference
                                      .snapshots()
                                      .map((QuestionQuerySnapshot questionQuerySnapshot){
                                        return questionQuerySnapshot.docs.map<Question>((QuestionQueryDocumentSnapshot questionQueryDocumentSnapshot){
                                          return questionQueryDocumentSnapshot.data;
                                        }).toList();
                                      });

                                    QuestionSection completedQuestionSection = questionSectionQueryDocumentSnapshot.data;

                                    completedQuestionSection.questions = questions;

                                    return completedQuestionSection;
                                }).toList();
                              });

                              // assign uncompleted Subcategory
                              Subcategory completedSubcategory = subcategoryQueryDocumentSnapshot.data;
                              // assign fields to complete Subcategory
                              completedSubcategory.articles = articles;
                              completedSubcategory.questionSections = questionSections;

                              return completedSubcategory;
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