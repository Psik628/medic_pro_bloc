import 'package:flutter/material.dart';
import 'package:medic_pro_bloc/presentation/labels.dart';

class Bar {
  static AppBar returnAppBar(){
    return AppBar(
      title: const Text(Labels.title, textAlign: TextAlign.center),
      centerTitle: true,
      leading: Container(),
    );
  }
}