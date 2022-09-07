import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/button/gf_button.dart';

import '../../../application/navigation/navigation_bloc.dart';
import '../../core/app_bar.dart';
import '../../core/bottom_navigation.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Bar.returnAppBar(),
        bottomNavigationBar: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: BottomNavigation(currentIndex: 2),
        ),
        body: Column(
          children: [
            ListTile(
              title: Text("change name")
            ),
            ListTile(
                title: Text("change email")
            ),
            ListTile(
                title: Text("change password")
            ),
            Spacer(),
            ListTile(
                title: GFButton(
                  fullWidthButton: true,
                  onPressed: () {  },
                  child: Text("sign out"),
                )
            )
          ],
        )
    );
  }
}
