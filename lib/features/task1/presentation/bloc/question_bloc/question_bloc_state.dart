import 'package:equatable/equatable.dart';

import '../../../data/models/question_model.dart';

abstract class QuestionBlocState extends Equatable {
  final QuestionModel? question;

  const QuestionBlocState({this.question});

  @override
  List get props => [question];
}

class QuestionLoading extends QuestionBlocState {
  const QuestionLoading();
}

class QuestionSuccess extends QuestionBlocState {
  const QuestionSuccess(QuestionModel? question) : super(question: question);
}

class QuestionFailed extends QuestionBlocState {
  final String message;

  const QuestionFailed(this.message);

  @override
  List<Object> get props => [message];
}