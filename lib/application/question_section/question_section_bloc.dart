import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';

import '../../domain/subject/option.dart';
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
          questions: [...transformedQuestions]
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
    on<AnswerQuestion>((AnswerQuestion event, emit) {
      log.i('Answering question');
      List<Question> addedAnsweredQuestion = [...state.questions];
      addedAnsweredQuestion.add(state.questions[state.questionToDisplayIndex]);
      emit(
        state.copyWith(
          // add current question to answered
          answeredQuestions: addedAnsweredQuestion,
          // move on to next question
          displayResults: true,
        )
      );
    });
    on<ResetDisplayResult>((ResetDisplayResult event, emit){
      log.i('Reseting display result, continuing to next question or to results page');
      emit(
        state.copyWith(
          displayResults: false,
          // when results have been viewed, user can continue to next question
          questionToDisplayIndex: state.questionToDisplayIndex + 1,
          quizFinished: state.questionToDisplayIndex == state.questions.length - 1
        )
      );
    });
    on<SetCorrectOptionsLength>((SetCorrectOptionsLength event, emit){
      log.i('Setting correctOptionsLength');
      // this functionality is used in results page
      List<Question> transformedQuestions = [...state.questions];
      // log.d(event.questionToDisplayIndex);
      // log.d(event.correctOptionsLength);
      transformedQuestions[event.questionToDisplayIndex].correctOptionsLength = event.correctOptionsLength;
      emit(
        state.copyWith(
          questions: transformedQuestions
        )
      );
    });
  }
}
