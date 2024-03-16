import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/usecase_template.dart';
import 'package:stroll_social_assignment/features/task3/domain/usecases/get_users.dart';
import 'package:stroll_social_assignment/features/task3/presentation/bloc/user/user_event.dart';
import 'package:stroll_social_assignment/features/task3/presentation/bloc/user/user_state.dart';
import 'package:stroll_social_assignment/utils/app_assets.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';

class UsersInfoBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUser;

  UsersInfoBloc(
    this.getUser,
  ) : super(const UserLoading()) {
    on<GetData>(onGetUserData);
  }

  void onGetUserData(UserEvent event, Emitter<UserState> emit) async {
    final users = await getUser(const Params(AppAssets.nearByUsersJson));

    if (users.error == null) {
      emit(UserSuccess(users.data));
    } else {
      emit(UserFailed(users.error?.message ?? AppStrings.somethingWentWrong));
    }
  }
}
