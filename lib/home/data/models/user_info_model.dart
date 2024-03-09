class UserInfoModel {
  UserInfoModel({
    required this.name,
    required this.age,
    required this.url,
  });


  String name;
  int age;
  String url;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        name: json["name"],
        age: json["age"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "url": url,
      };
}
