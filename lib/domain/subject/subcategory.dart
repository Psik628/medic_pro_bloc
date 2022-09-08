import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:medic_pro_bloc/domain/subject/article.dart';
import 'package:medic_pro_bloc/domain/subject/questionsection.dart';

// import '../../infrastructure/constants/dbconstants.dart';

// manual import of generated file
part 'subcategory.g.dart';

@JsonSerializable(explicitToJson: true)
class Subcategory{

  // factory Subcategory(title, titleUI){
  //   IconData icon;
    // set icon in factory constructor
    // switch(title){
    // // BIOLOGY
    //   // CELL
    //   case BIOLOGY_CELL_METABOLISM:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_EUKARYOTES:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_LIVING_SYSTEM:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_PROKARYOTES:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_VIRUSES_AND_PRIONS:
    //     icon = Icons.circle;
    //     break;
    //   default:
    //     icon = Icons.ac_unit; // error
    // }

    // todo tmp fix
  //   icon = Icons.add;
  //
  //   return Subcategory._internal(title, titleUI, icon);
  // }

  // Subcategory._internal(this.title, this.titleUI, this.icon);

  final String title;

  final String titleUI;

  // added later
  @JsonKey(ignore: true)
  late Stream<List<Article>> articles;
  // added later
  @JsonKey(ignore: true)
  late Stream<List<QuestionSection>> questionSections;

  Subcategory({required this.title, required this.titleUI});

  // final IconData icon;

  factory Subcategory.fromJson(Map<String, Object?> json) => _$SubcategoryFromJson(json);

  Map<String, Object?> toJson() => _$SubcategoryToJson(this);
}