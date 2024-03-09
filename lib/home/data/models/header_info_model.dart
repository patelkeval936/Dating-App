class HeaderInfoModel {
  String title;
  String time;
  int followers;

  HeaderInfoModel({
    required this.title,
    required  this.time,
    required this.followers,
  });

  factory HeaderInfoModel.fromJson(Map<String, dynamic> json) => HeaderInfoModel(
    title: json["title"],
    time: json["time"],
    followers: json["followers"],
  );

}
