import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stroll_social_assignment/core/usecase_template.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/header_bloc/header_bloc_event.dart';
import 'package:stroll_social_assignment/home/presentation/bloc/header_bloc/header_bloc_state.dart';
import 'package:stroll_social_assignment/utils/app_assets.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';
import '../../../domain/usecases/get_header.dart';

class HeaderBloc extends Bloc<HeaderBlocEvents, HeaderBlocState> {
  final GetHeader getHeader;

  HeaderBloc(
    this.getHeader,
  ) : super(const HeaderLoading()) {
    on<GetData>(onGetHeaderData);
  }

  void onGetHeaderData(
      HeaderBlocEvents event, Emitter<HeaderBlocState> emit) async {
    final header = await getHeader(const Params(AppAssets.headerJson));

    if (header.error == null) {
      emit(HeaderSuccess(header.data));
    } else {
      emit(HeaderFailed(
          header.error?.message ?? AppStrings.somethingWentWrong));
    }
  }
}
