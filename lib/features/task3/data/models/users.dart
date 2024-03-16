import 'package:stroll_social_assignment/features/task3/data/models/user_model.dart';

class Users {
  List<UserModel> users = [];

  Users({required this.users});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        users: json["users"] == null
            ? []
            : List<UserModel>.from(
                json["users"]!.map((x) => UserModel.fromJson(x))));
  }
}
