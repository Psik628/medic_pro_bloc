import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';

// manual import of generated file
part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category{

  // factory Category(String title, String titleUI){
  //   IconData icon;

    // // set icon in factory constructor
    // switch(title){
    // // BIOLOGY
    //   case BIOLOGY_CELL:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_GENETICS:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_BOTANICS:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_ZOOLOGY:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_EVOLUTION:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_SOMATOLOGY:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_INVENTIONS:
    //     icon = Icons.circle;
    //     break;
    //   case BIOLOGY_ECOLOGY:
    //     icon = Icons.circle;
    //     break;
    //   case CHEMISTRY_BIOCHEMISTRY:
    //     icon = Icons.circle;
    //     break;
    //   case CHEMISTRY_CHEMICAL_CALCULATIONS:
    //     icon = Icons.circle;
    //     break;
    //   case CHEMISTRY_GENERAL:
    //     icon = Icons.circle;
    //     break;
    //   case CHEMISTRY_ORGANIC:
    //     icon = Icons.circle;
    //     break;
    //   case CHEMISTRY_INORGANIC:
    //     icon = Icons.circle;
    //     break;
    //   case PHYSICS_ELECTRICITY_AND_MAGNETISM:
    //     icon = Icons.circle;
    //     break;
    //   case PHYSICS_MECHANICS:
    //     icon = Icons.circle;
    //     break;
    //   case PHYSICS_MICROCOSM_SPECIAL_RELATIVITY:
    //     icon = Icons.circle;
    //     break;
    //   case PHYSICS_MOLECULAR_THERMODYNAMICS:
    //     icon = Icons.circle;
    //     break;
    //   case PHYSICS_OPTICS:
    //     icon = Icons.circle;
    //     break;
    //   case PHYSICS_UNITS:
    //     icon = Icons.circle;
    //     break;
    //   case PHYSICS_STRUCTURE_AND_PROPERTIES_OF_SUBSTANCES:
    //     icon = Icons.circle;
    //     break;
    //   default:
    //     icon = Icons.ac_unit; // error
    // }

    // // todo tmp fix
    // icon = Icons.add;

    // return Category._internal(title, titleUI, icon);
  // }

  // Category._internal(this.title, this.titleUI ,this.icon);

  Category({required this.title, required this.titleUI});

  final String title;

  final String titleUI;

  // added later
  @JsonKey(ignore: true)
  late Stream<List<Subcategory>> subcategories;

  factory Category.fromJson(Map<String, Object?> json) => _$CategoryFromJson(json);

  Map<String, Object?> toJson() => _$CategoryToJson(this);
}