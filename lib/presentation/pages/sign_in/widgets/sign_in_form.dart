import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/sign_in/sign_in_bloc.dart';
import '../../../../domain/auth/auth_failure.dart';
import '../../../../translations_constants.dart';
import '../../../labels.dart';
import '../../../routes/app_router.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if(state.authFailure != null && state.authFailure != const AuthFailure.initial()){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: const Text(TranslationsConstants.authenticationError).tr())
          );
        }else if(state.authFailure == null){
          // authFailure can not be initial, must change to null in process
          AutoRouter.of(context).push(const HomePageRoute());
          // adding event to another bloc
          context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
        }
      },
      // todo implement build when
      builder: (context, state) {

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(Labels.title),
              Form(
                // key: formKey,
                // todo implement auto validate option
                autovalidateMode: state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: state.showErrorMessages.toString()
                        ),
                        onChanged: (String emailRawValue){
                          context.read<SignInBloc>().add(SignInEvent.emailChanged(emailRawValue));
                        },
                        // todo implement maybe map
                        validator: (_){
                          // todo access state properly
                          if(!context.watch<SignInBloc>().state.showErrorMessages){
                            return null;
                          }
                          return state.emailAddress.value.fold((l) => TranslationsConstants.emailError.tr(), (r) => null);
                        }
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: TranslationsConstants.password.tr(),
                        ),
                        onChanged: (String passwordRawValue) => context.read<SignInBloc>().add(SignInEvent.passwordChanged(passwordRawValue)),
                        // todo implement maybe map
                        validator: (_){
                          // todo access state properly
                          if(!context.watch<SignInBloc>().state.showErrorMessages){
                            return null;
                          }

                          return state.password.value.fold((l) => TranslationsConstants.passwordError.tr(), (r) => null);
                        }
                    ),
                    GFButton(
                      onPressed: () {
                        context.read<SignInBloc>().add(const SignInEvent.signInWithEmailAndPasswordPressed());
                      },
                      color: GFColors.SUCCESS,
                      fullWidthButton: true,
                      child: const Text(TranslationsConstants.signIn).tr(),
                    ),
                    GFButton(
                      onPressed: () {
                        //
                      },
                      color: GFColors.INFO,
                      fullWidthButton: true,
                      child: const Text(TranslationsConstants.signInWithGoogle).tr(),
                    ),
                    GFButton(
                      onPressed: () {
                        //
                      },
                      color: GFColors.LIGHT,
                      fullWidthButton: true,
                      child: const Text(TranslationsConstants.createAccount).tr(),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
