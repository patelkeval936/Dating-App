
import 'option_model.dart';

class QuestionModel {
  String question;
  String answer;
  List<OptionModel> options;

  QuestionModel({
    required this.question,
    required this.answer,
    required this.options,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    question: json["question"],
    answer: json["answer"],
    options: json["options"] == null ? [] : List<OptionModel>.from(json["options"]!.map((x) => OptionModel.fromJson(x))),
  );

}


