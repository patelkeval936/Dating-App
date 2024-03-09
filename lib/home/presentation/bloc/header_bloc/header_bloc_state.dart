import 'package:equatable/equatable.dart';
import 'package:stroll_social_assignment/home/data/models/header_info_model.dart';

abstract class HeaderBlocState extends Equatable {
  final HeaderInfoModel? headerInfo;

  const HeaderBlocState({this.headerInfo});

  @override
  List get props => [headerInfo];
}

class HeaderLoading extends HeaderBlocState {
  const HeaderLoading();
}

class HeaderSuccess extends HeaderBlocState {
  const HeaderSuccess(HeaderInfoModel? headerInfo)
      : super(headerInfo: headerInfo);
}

class HeaderFailed extends HeaderBlocState {
  final String message;

  const HeaderFailed(this.message);

  @override
  List<Object> get props => [message];
}