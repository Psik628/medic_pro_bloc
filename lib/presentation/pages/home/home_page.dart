import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:medic_pro_bloc/application/auth/auth_bloc.dart';
import 'package:medic_pro_bloc/presentation/routes/app_router.dart';
import '../../../application/database/subject/subject_bloc.dart';
import '../../../application/navigation/navigation_bloc.dart';
import '../../../injection.dart';
import '../../core/app_bar.dart';
import '../../core/bottom_navigation.dart';
import '../../ui_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar.returnAppBar(),
      bottomNavigationBar: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: const BottomNavigation(),
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(
            vertical: UIConstants.safeAreaPaddingVertical,
            horizontal: UIConstants.safeAreaPaddingHorizontal
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) =>
              getIt<AuthBloc>()
                ..add(const AuthEvent.authCheckRequested()),
            ),
            BlocProvider<SubjectBloc>(
                create: (context) =>
                getIt<SubjectBloc>()
                  ..add(const SubjectEvent.watchAll())
            ),
          ],
          child: BlocConsumer<SubjectBloc, SubjectState>(
            listener: (context, state) {
              if(state is Unauthenticated) AutoRouter.of(context).replace(const SignInPageRoute());
            },
            builder: (context, SubjectState state) {

                return state.map(
                  initial: (_) => const GFLoader(type: GFLoaderType.square),
                  loadInProgress: (_) => const GFLoader(),
                  loadFailure: (LoadFailure value) {
                    print(value);
                    return const GFLoader(type: GFLoaderType.square);
                  },
                  loadSuccess: (LoadSuccess state) {
                    return ListView.builder(
                      itemCount: state.subjects.length,
                      itemBuilder: (context, subjectIndex) {
                        final subject = state.subjects[subjectIndex];
                        // todo check the code below
                        // if (note.failureOption.isSome()) {
                        //   return ErrorNoteCard(note: note);
                        // } else {
                        //   return NoteCard(note: note);
                        // }
                        return ExpansionTile(
                            title: Text(subject.title),
                            children: [
                              StreamBuilder(
                                  stream: subject.categories,
                                  builder: (BuildContext context, AsyncSnapshot snapshot){
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const GFLoader();
                                    }else if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){

                                      return ListView.builder(
                                          itemCount: snapshot.data.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, categoryIndex){
                                            return ListTile(
                                              title: Text(snapshot.data[categoryIndex].title),
                                            );
                                          }
                                      );
                                    }
                                    return const GFLoader();
                                  }
                              )
                            ],
                        );
                      },
                    );
                  },
                );
              },
          )
        ),
      ),
    );
  }
}