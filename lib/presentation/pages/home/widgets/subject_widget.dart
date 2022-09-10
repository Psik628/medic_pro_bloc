import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:medic_pro_bloc/presentation/pages/home/widgets/category_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../domain/subject/category.dart';


import '../../../../domain/subject/subject.dart';

class SubjectWidget extends StatelessWidget {

  final Subject currentSubject;

  const SubjectWidget({Key? key, required this.currentSubject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(currentSubject.title).tr(),
      leading: SizedBox(
          height: 15.h,
          width: 15.w,
          // todo extract this
          child: Image.asset('assets/${currentSubject.title}.png'),
      ),
      children: [
        StreamBuilder(
            stream: currentSubject.categories,
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const GFLoader();
              }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, categoryIndex){
                    final Category currentCategory = snapshot.data[categoryIndex];
                    return CategoryWidget(currentCategory: currentCategory);
                  }
                );
              }
              return const GFLoader();
            }
        )
      ],
    );
  }
}
