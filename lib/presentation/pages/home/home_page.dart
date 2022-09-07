import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:medic_pro_bloc/application/auth/auth_bloc.dart';
import 'package:medic_pro_bloc/application/navigation/navigation_bloc.dart';
import 'package:medic_pro_bloc/application/subject/subject_bloc.dart';
import 'package:medic_pro_bloc/presentation/routes/app_router.dart';
import '../../../injection.dart';
import '../../core/app_bar.dart';
import '../../core/bottom_navigation.dart';
import '../../ui_constants.dart';
import 'package:medic_pro_bloc/application/subject/subject_bloc.dart' as SubjectBlocProvider;


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
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
        child: BlocListener<SubjectBloc, SubjectState>(
          listener: (context, state) {
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if(state is Unauthenticated) AutoRouter.of(context).replace(const SignInPageRoute());
              },
            );
          },
          child: BlocBuilder<SubjectBloc, SubjectState>(
            builder: (context, SubjectState state) {
              
              return state.map(
                initial: (_) => Container(),
                loadInProgress: (_) => const GFLoader(),
                loadFailure: (LoadFailure value) {
                  return const GFLoader(type: GFLoaderType.square);
                },
                loadSuccess: (LoadSuccess state) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final subject = state.notes[index];
                      // if (note.failureOption.isSome()) {
                      //   return ErrorNoteCard(note: note);
                      // } else {
                      //   return NoteCard(note: note);
                      // }
                      return ExpansionTile(title: Text(subject.title));

                    },
                    itemCount: state.notes.length,
                  );
                },
              );
              
              
              if (state is SubjectBlocProvider.Initial) {
                return const GFLoader(type: GFLoaderType.android);
              } else if (state is SubjectBlocProvider.LoadInProgress) {
                return const GFLoader(type: GFLoaderType.ios);
              } else if (state is SubjectBlocProvider.LoadFailure) {
                const GFLoader();
              } else {
                return Scaffold(
                  appBar: Bar.returnAppBar(),
                  bottomNavigationBar: BlocProvider(
                    create: (context) => NavigationBloc(),
                    child: const BottomNavigation(),
                  ),
                  body: SafeArea(
                      minimum: EdgeInsets.symmetric(
                          vertical: UIConstants.safeAreaPaddingVertical,
                          horizontal: UIConstants.safeAreaPaddingHorizontal
                      ),
                      child: ListView.builder(

                          itemBuilder: (context, index){
                            return ExpansionTile(title: Text('ahoj'));
                          }
                      )
                      // child: ListView(
                      //   padding: const EdgeInsets.all(8),
                      //   children: [
                      //     ExpansionTile(
                      //       leading: SizedBox(
                      //           child: Image.asset('assets/acoustics.png')
                      //       ),
                      //       title: const Text('Biology'),
                      //       children: [
                      //         ListTile(
                      //             leading: SizedBox(
                      //                 child: Image.asset('assets/acoustics.png')
                      //             ),
                      //             title: Text('This is tile number 1')
                      //         ),
                      //       ],
                      //     ),
                      //     ExpansionTile(
                      //       leading: SizedBox(
                      //           child: Image.asset('assets/acoustics.png')
                      //       ),
                      //       title: const Text('Chemistry'),
                      //       children: [
                      //         ListTile(
                      //             leading: SizedBox(
                      //                 child: Image.asset('assets/acoustics.png')
                      //             ),
                      //             title: Text('This is tile number 1')
                      //         ),
                      //       ],
                      //     ),
                      //     ExpansionTile(
                      //       leading: SizedBox(
                      //           child: Image.asset('assets/acoustics.png')
                      //       ),
                      //       title: const Text('Physics'),
                      //       children: [
                      //         ListTile(
                      //             leading: SizedBox(
                      //                 child: Image.asset('assets/acoustics.png')
                      //             ),
                      //             title: Text('This is tile number 1')
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // )
                  ),
                );
              } // todo fix this nonsense
              return const Offstage();
            },
          ),
        ),
      ),
    );
  }
}

// class NotesOverviewBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
//       builder: (context, state) {
//         return state.map(
//           initial: (_) => Container(),
//           loadInProgress: (_) => const Center(
//             child: CircularProgressIndicator(),
//           ),
//           loadSuccess: (state) {
//             return ListView.builder(
//               itemBuilder: (context, index) {
//                 final note = state.notes[index];
//                 if (note.failureOption.isSome()) {
//                   return ErrorNoteCard(note: note);
//                 } else {
//                   return NoteCard(note: note);
//                 }
//               },
//               itemCount: state.notes.size,
//             );
//           },
//           loadFailure: (state) {
//             return CriticalFailureDisplay(
//               failure: state.noteFailure,
//             );
//           },
//         );
//       },
//     );
//   }
// }