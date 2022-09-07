import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_pro_bloc/presentation/core/bottom_navigation.dart';

import '../../../application/navigation/navigation_bloc.dart';
import '../../core/app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar.returnAppBar(),
      bottomNavigationBar: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: BottomNavigation(currentIndex: 1),
      ),
      body: Container()
    );
  }
}
