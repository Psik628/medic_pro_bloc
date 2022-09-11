import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medic_pro_bloc/application/database/profile/profile_bloc.dart';
import 'package:medic_pro_bloc/presentation/core/bottom_navigation.dart';
import 'package:medic_pro_bloc/presentation/pages/profile/widgets/scoreboard.dart';
import 'package:sizer/sizer.dart';

import '../../../application/navigation/navigation_bloc.dart';
import '../../../injection.dart';
import '../../core/app_bar.dart';
import '../../ui_constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
            appBar: Bar.returnAppBar(),
            bottomNavigationBar: BlocProvider<NavigationBloc>(
              create: (context) => NavigationBloc(),
              child: BottomNavigation(currentIndex: 1),
            ),
            body: SafeArea(
              minimum: EdgeInsets.symmetric(
                  vertical: UIConstants.safeAreaPaddingVertical,
                  horizontal: UIConstants.safeAreaPaddingHorizontal
              ),
              child: BlocProvider<ProfileBloc>(
                create: (context) => getIt<ProfileBloc>(),
                child: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, ProfileState state){
                    return Column(
                      children: [
                        Row(
                          children: const [
                            Expanded(
                              child: Center(
                                child: Text(
                                  'janko',
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: const [
                          Expanded(
                              child: Center(
                                child: Text(
                                  'email',
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                                  children: [
                                    ScoreboardWidget(),
                                    ScoreboardWidget(),
                                    ScoreboardWidget(),
                                    ScoreboardWidget()
                                  ],
                                )
                            )
                          ],
                        ),
                      ],
                    );
                  }
                ),
              ),
            )
        );
      }
    );
  }
}
