import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medic_pro_bloc/domain/subject/question.dart';

import '../../domain/subject/option.dart';

part 'question_section_event.dart';
part 'question_section_state.dart';

part 'question_section_bloc.freezed.dart';

@injectable
class QuestionSectionBloc extends Bloc<QuestionSectionEvent, QuestionSectionState> {
  QuestionSectionBloc() : super(QuestionSectionState.initial()) {
    on<AnswerQuestion>((AnswerQuestion event, emit) {
      emit(
        state.copyWith(
          answeredQuestions: state.answeredQuestions..add(event.question)
        )
      );
    });
    on<AnswerFinalQuestion>((AnswerFinalQuestion event, emit) {
      // TODO: implement event handler
    });
    on<SelectOption>((SelectOption event, emit) {
      event.question.selectedOptions.add(event.option);

      emit(
        state.copyWith(
          // todo tomorrow :D
        )
      );
    });
    on<UnSelectOption>((UnSelectOption event, emit) {
      // TODO: implement event handler
    });
  }
}
