import 'scrolled_position.dart';

class UserModel {
  String name;
  int age;
  String description;
  String profileUrl;
  ScrolledPosition? position;

  UserModel(
      {required this.name,
      required this.age,
      required this.description,
      required this.profileUrl,
      this.position});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        description: json['info'],
        age: json['age'],
        profileUrl: json['url'],
      );
}
