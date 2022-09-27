import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';

import '../../domain/subject/option.dart' as Option;
import '../../domain/subject/questionsection_failure.dart';
import '../../domain/subject/subject.dart';
import '../../logging.dart';

part 'question_section_event.dart';
part 'question_section_state.dart';
part 'question_section_bloc.freezed.dart';

@injectable
class QuestionSectionBloc extends Bloc<QuestionSectionEvent, QuestionSectionState> {
  final log = logger(QuestionSectionBloc);

  // define initial state structure
  QuestionSectionBloc() : super(QuestionSectionState.initial()) {
    // initialize basic functionality
    on<ManualInitialization>((ManualInitialization event, emit) {
      log.i('Manually setting QuestionSectionBloc initial data');
      emit(
        state.copyWith(
          questionToDisplayIndex: event.questionToDisplayIndex,
          questions: event.questions
        )
      );
    });
    on<SelectOption>((SelectOption event, emit) {
      log.i('Selecting Option');
      List<Question> transformedQuestions = [...state.questions];
      transformedQuestions[state.questionToDisplayIndex].addToSelectedOptions(event.option);
      emit(
        state.copyWith(
          questions: transformedQuestions
        )
      );
    });
    on<UnSelectOption>((UnSelectOption event, emit) {
      log.i('Unselecting Option');
      List<Question> transformedQuestions = [...state.questions];
      // equatable for options needs to be implemented
      transformedQuestions[state.questionToDisplayIndex].removeSelectedOption(event.option);
      emit(
          state.copyWith(
              questions: transformedQuestions
          )
      );
    });
    // on<AnswerQuestion>((AnswerQuestion event, emit) {
    //   emit(
    //     // state.copyWith(
    //     //   answeredQuestions: state.answeredQuestions..add(event.question),
    //     //   questionToDisplayIndex: state.questionToDisplayIndex + 1
    //     // )
    //     state.
    //   );
    // });
    //
    // on<AnswerFinalQuestion>((AnswerFinalQuestion event, emit) {
    //   // TODO: implement event handler
    // });
  }
}
