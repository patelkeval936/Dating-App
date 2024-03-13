
import 'package:flutter_bloc/flutter_bloc.dart';

class OptionCubit extends Cubit<String?>{
  OptionCubit() : super(null);

  void selectOption(String? option) async{
    emit(option);
  }

  String? get getSelectedOption => state;
}