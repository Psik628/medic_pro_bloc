import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'answered_question_section_event.dart';
part 'answered_question_section_state.dart';

class AnsweredQuestionSectionBloc extends Bloc<AnsweredQuestionSectionEvent, AnsweredQuestionSectionState> {
  AnsweredQuestionSectionBloc() : super(AnsweredQuestionSectionInitial()) {
    on<AnsweredQuestionSectionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
