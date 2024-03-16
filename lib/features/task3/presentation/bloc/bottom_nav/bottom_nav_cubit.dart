import 'package:bloc/bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(1);

  void changeSelectedIndexTo(int index){
    emit(index);
  }

}
