import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';


import 'package:medic_pro_bloc/domain/subject/questionsection.dart';

import 'article.dart';
import 'category.dart';
import 'option.dart';

// manual import of generated file
part 'subject.g.dart';

@JsonSerializable(explicitToJson: true)
class Subject{

  // factory Subject(String title, String titleUI){
  //
  //   IconData icon;
  //
  //   // todo extract this
  //   // set icon in factory contructor
  //   if(title == "biology") icon = Icons.biotech;
  //   else if(title == 'chemistry') icon = Icons.science;
  //   else if(title == 'physics') icon = Icons.calculate;
  //   else icon = Icons.ac_unit;
  //
  //   return Subject._internal(title: title, titleUI: titleUI, icon: icon);
  // }
  //
  // Subject._internal({required this.title, required this.titleUI, required this.icon});

  Subject({required this.title, required this.titleUI});

  final String title;

  final String titleUI;

  // added later
  late Stream<List<Category>> categories;

  // final IconData icon;

  factory Subject.fromJson(Map<String, Object?> json) => _$SubjectFromJson(json);

  Map<String, Object?> toJson() => _$SubjectToJson(this);
}

@Collection<Subject>('MSubjects')
@Collection<Category>('MSubjects/*/categories')
@Collection<Subcategory>('MSubjects/*/categories/*/subcategories')
@Collection<Article>('MSubjects/*/categories/*/subcategories/*/articles')
@Collection<QuestionSection>('MSubjects/*/categories/*/subcategories/*/questionsections')
@Collection<Question>('MSubjects/*/categories/*/subcategories/*/questionsections/*/questions')
@Collection<Option>('MSubjects/*/categories/*/subcategories/*/questionsections/*/questions/*/options')
final subjectsRef = SubjectCollectionReference();

// AddressCollectionReference addressesRef = usersRef.doc('myDocumentID').addresses;