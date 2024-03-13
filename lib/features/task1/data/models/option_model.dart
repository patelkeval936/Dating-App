class OptionModel {
  String option;
  String text;

  OptionModel({
    required this.option,
    required this.text,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
    option: json["option"],
    text: json["text"],
  );

}