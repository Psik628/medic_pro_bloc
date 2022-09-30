import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';
import 'package:medic_pro_bloc/domain/subject/questionsection.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';
import 'package:medic_pro_bloc/domain/subject/subject.dart' as Subject;
import 'package:medic_pro_bloc/domain/subject/option.dart' as Option;
import 'package:medic_pro_bloc/domain/subject/subject_failure.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/subject/article.dart';
import '../../domain/subject/category.dart';
import '../../domain/subject/i_subject_repository.dart';
import '../../domain/subject/subject.dart';

@LazySingleton(as: ISubjectRepository)
class SubjectRepository implements ISubjectRepository{

  final FirebaseFirestore _firestore;

  SubjectRepository(this._firestore);

  @override
  Stream<Either<SubjectFailure, List<Subject.Subject>>> watchAll() async* {

    yield*  subjectsRef
        //snapshots() returns a stream of QuerySnapshot
        .snapshots()
        //list
        .map((snapshot){
          // to domain
          return right<SubjectFailure, List<Subject.Subject>>(
              snapshot.docs.map<Subject.Subject>((SubjectQueryDocumentSnapshot subjectQueryDocumentSnapshot){
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

                              print('INSIDE REPOSITORY');

                              ArticleCollectionReference articleCollectionReference = subjectsRef.doc(subjectQueryDocumentSnapshot.data.title).categories.doc(categoryQueryDocumentSnapshot.id).subcategories.doc(subcategoryQueryDocumentSnapshot.id).articles;

                              // fill subcategory with articles
                              Stream<List<Article>> articles = articleCollectionReference
                                .snapshots()
                                .map((ArticleQuerySnapshot articleQuerySnapshot){

                                  print('completings articles');

                                  return articleQuerySnapshot.docs.map<Article>((ArticleQueryDocumentSnapshot articleQueryDocumentSnapshot){
                                    return articleQueryDocumentSnapshot.data;
                                  }).toList();
                                });

                              QuestionSectionCollectionReference questionSectionCollectionReference = subjectsRef.doc(subjectQueryDocumentSnapshot.data.title).categories.doc(categoryQueryDocumentSnapshot.id).subcategories.doc(subcategoryQueryDocumentSnapshot.id).questionsections;

                              // fill subcategory with question sections
                              Stream<List<QuestionSection>> questionSections = questionSectionCollectionReference
                                  .snapshots()
                                  .map((QuestionSectionQuerySnapshot questionSectionQuerySnapshot){

                                    print('completing question section');

                                    return questionSectionQuerySnapshot.docs.map<QuestionSection>((QuestionSectionQueryDocumentSnapshot questionSectionQueryDocumentSnapshot){
                                    // fill question section with questions
                                    QuestionCollectionReference questionCollectionReference = subjectsRef.doc(subjectQueryDocumentSnapshot.data.title).categories.doc(categoryQueryDocumentSnapshot.id).subcategories.doc(subcategoryQueryDocumentSnapshot.id).questionsections.doc(questionSectionQueryDocumentSnapshot.id).questions;
                                    Stream<List<Question>> questions = questionCollectionReference
                                      .snapshots()
                                      .map((QuestionQuerySnapshot questionQuerySnapshot){

                                        print('completing questions');

                                        return questionQuerySnapshot.docs.map<Question>((QuestionQueryDocumentSnapshot questionQueryDocumentSnapshot){
                                          // fill question with options
                                          OptionCollectionReference optionCollectionReference = subjectsRef.doc(subjectQueryDocumentSnapshot.data.title).categories.doc(categoryQueryDocumentSnapshot.id).subcategories.doc(subcategoryQueryDocumentSnapshot.id).questionsections.doc(questionSectionQueryDocumentSnapshot.id).questions.doc(questionQueryDocumentSnapshot.id).options;
                                          Stream<List<Option.Option>> options = optionCollectionReference
                                            .snapshots()
                                            .map((OptionQuerySnapshot optionQuerySnapshot){
                                              return optionQuerySnapshot.docs.map<Option.Option>((OptionQueryDocumentSnapshot optionQueryDocumentSnapshot){
                                                return optionQueryDocumentSnapshot.data;
                                              }).toList();
                                            });

                                          Question completedQuestion = questionQueryDocumentSnapshot.data;

                                          // some try to push correct options length into question
                                          // int correctOptionsLength = questionQueryDocumentSnapshot.data.options.where((Option.Option option) {
                                          //   return option.correct;
                                          // }).length;

                                          completedQuestion.options = options;

                                          return completedQuestion;

                                        }).toList();
                                      });

                                    QuestionSection completedQuestionSection = questionSectionQueryDocumentSnapshot.data;

                                    print('RETURNING COMPLETED QUESTION SECTION');

                                    completedQuestionSection.questions = questions;

                                    print(completedQuestionSection.questions.isEmpty);

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

                Subject.Subject completedSubject = subjectQueryDocumentSnapshot.data;
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