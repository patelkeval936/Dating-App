import 'package:equatable/equatable.dart';
import 'package:stroll_social_assignment/home/data/models/user_info_model.dart';

abstract class UserBlocState extends Equatable {
  final UserInfoModel? userInfo;

  const UserBlocState({this.userInfo});

  @override
  List get props => [userInfo];
}

class UserLoading extends UserBlocState {
  const UserLoading();
}

class UserSuccess extends UserBlocState {
  const UserSuccess(UserInfoModel? userInfo) : super(userInfo: userInfo);
}

class UserFailed extends UserBlocState {
  final String message;

  const UserFailed(this.message);

  @override
  List<Object> get props => [message];
}