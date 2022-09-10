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
      // TODO: implement event handler
    });
    on<AnswerFinalQuestion>((AnswerFinalQuestion event, emit) {
      // TODO: implement event handler
    });
    on<SelectOption>((SelectOption event, emit) {
      // TODO: implement event handler
    });
    on<UnSelectOption>((UnSelectOption event, emit) {
      // TODO: implement event handler
    });
  }
}
