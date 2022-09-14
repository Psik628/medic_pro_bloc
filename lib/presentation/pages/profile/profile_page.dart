import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:medic_pro_bloc/application/database/profile/profile_bloc.dart';
import 'package:medic_pro_bloc/presentation/core/bottom_navigation.dart';
import 'package:medic_pro_bloc/presentation/pages/profile/widgets/scoreboard_wrapper.dart';
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

                    return state.map(
                      initial: (_) => const GFLoader(type: GFLoaderType.ios),
                      loadInProgress: (_) => const GFLoader(),
                      loadFailure: (LoadFailure value) {
                        return const GFLoader(type: GFLoaderType.square);
                      },
                      loadSuccess: (LoadSuccess state) {
                        return StreamBuilder(
                            stream: state.user.answeredQuestionSections,
                            builder: (BuildContext context, AsyncSnapshot snapshot){
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const GFLoader();
                              }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){

                                return ScoreBoardWrapperWidget(answeredQuestionSections: snapshot.data);
                              }
                              return const GFLoader();
                            }
                        );
                      },
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
