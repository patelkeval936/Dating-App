import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/usecase_template.dart';
import 'package:stroll_social_assignment/features/task1/presentation/bloc/question_bloc/question_bloc_event.dart';
import 'package:stroll_social_assignment/features/task1/presentation/bloc/question_bloc/question_bloc_state.dart';
import 'package:stroll_social_assignment/utils/app_assets.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';

import '../../../domain/usecases/get_question.dart';

class QuestionBloc extends Bloc<QuestionBlocEvents, QuestionBlocState> {
  final GetQuestion getQuestion;

  QuestionBloc(
    this.getQuestion,
  ) : super(const QuestionLoading()) {
    on<GetData>(onGetQuestionData);
  }

  void onGetQuestionData(
      QuestionBlocEvents event, Emitter<QuestionBlocState> emit) async {
    final question = await getQuestion(const Params(AppAssets.questionJson));

    if (question.error == null) {
      emit(QuestionSuccess(question.data));
    } else {
      emit(QuestionFailed(question.error?.message ?? AppStrings.somethingWentWrong));
    }
  }
}
