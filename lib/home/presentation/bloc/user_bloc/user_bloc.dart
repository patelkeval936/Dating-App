import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/usecase_template.dart';
import 'package:stroll_social_assignment/home/domain/usecases/get_user.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/user_bloc/user_bloc_event.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/user_bloc/user_bloc_state.dart';
import 'package:stroll_social_assignment/utils/app_assets.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';

class UserBloc extends Bloc<UserBlocEvents, UserBlocState> {
  final GetUser getUser;

  UserBloc(
    this.getUser,
  ) : super(const UserLoading()) {
    on<GetData>(onGetUserData);
  }

  void onGetUserData(UserBlocEvents event, Emitter<UserBlocState> emit) async {
    final user = await getUser(const Params(AppAssets.userJson));
    if (user.error == null) {
      emit(UserSuccess(user.data));
    } else {
      emit(UserFailed(user.error?.message ?? AppStrings.somethingWentWrong));
    }
  }
}
