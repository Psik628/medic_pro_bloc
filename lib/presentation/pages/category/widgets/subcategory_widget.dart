import 'package:flutter/cupertino.dart';
import 'package:medic_pro_bloc/domain/subject/subcategory.dart';

class SubcategoryWidget extends StatelessWidget {

  final Subcategory currentSubcategory;

  const SubcategoryWidget({Key? key, required this.currentSubcategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(currentSubcategory.title);
  }
}
