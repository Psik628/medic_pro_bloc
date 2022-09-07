import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:medic_pro_bloc/application/auth/auth_bloc.dart';
import 'package:medic_pro_bloc/presentation/routes/app_router.dart';
import '../../../application/database/subject/subject_bloc.dart';
import '../../../injection.dart';
import '../../core/app_bar.dart';
import '../../ui_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar.returnAppBar(),
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
                  initial: (_) => Container(),
                  loadInProgress: (_) => const GFLoader(),
                  loadFailure: (LoadFailure value) {
                    print(value);
                    return const GFLoader(type: GFLoaderType.square);
                  },
                  loadSuccess: (LoadSuccess state) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final subject = state.notes[index];
                        // todo check the code below
                        // if (note.failureOption.isSome()) {
                        //   return ErrorNoteCard(note: note);
                        // } else {
                        //   return NoteCard(note: note);
                        // }
                        return ExpansionTile(
                            title: Text(subject.title),
                            children: [

                            ],
                        );
                      },
                      itemCount: state.notes.length,
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