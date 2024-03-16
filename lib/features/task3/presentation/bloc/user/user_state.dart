import 'package:equatable/equatable.dart';
import 'package:stroll_social_assignment/features/task3/data/models/users.dart';

abstract class UserState extends Equatable {
  final Users? users;

  const UserState({this.users});

  @override
  List get props => [users];
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserSuccess extends UserState {
  const UserSuccess(Users? users) : super(users: users);
}

class UserFailed extends UserState {
  final String message;

  const UserFailed(this.message);

  @override
  List<Object> get props => [message];
}
