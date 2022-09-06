import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_pro_bloc/application/navigation/navigation_bloc.dart';

import '../routes/app_router.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {
        if(state is Home){
          AutoRouter.of(context).push(const HomePageRoute());
        }else if(state is Profile){
          AutoRouter.of(context).push(const ProfilePageRoute());
        }else if(state is Settings){
          AutoRouter.of(context).push(const SettingsPageRoute());
        }
      },
      builder: (context, state) {
        return BottomNavigationBar(
          // currentIndex: index,
          onTap: (index) {
            switch(index){
              case 0:
                context.read<NavigationBloc>().add(const NavigateTo(destination: Destination.home));
                break;
              case 1:
                context.read<NavigationBloc>().add(const NavigateTo(destination: Destination.profile));
                break;
              case 2:
                context.read<NavigationBloc>().add(const NavigateTo(destination: Destination.settings));
                break;
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.question_mark),
              label: 'questions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
            ),
          ],
        );
      },
    );
  }
}
