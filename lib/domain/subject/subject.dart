// class Subject{
//
//   factory Subject(String title, String titleUI){
//
//     IconData icon;
//
//     // set icon in factory contructor
//     if(title == "biology") icon = Icons.biotech;
//     else if(title == 'chemistry') icon = Icons.science;
//     else if(title == 'physics') icon = Icons.calculate;
//     else icon = Icons.ac_unit;
//
//     return Subject._internal(title: title, titleUI: titleUI, icon: icon);
//   }
//
//   Subject._internal({required this.title, required this.titleUI, required this.icon});
//
//   final String title;
//
//   final String titleUI;
//
//   final IconData icon;
//
//   factory Subject.fromJson(Map<String, Object?> json) => _$SubjectFromJson(json);
//
//   Map<String, Object?> toJson() => _$SubjectToJson(this);
// }

// class Subject{
//
// }