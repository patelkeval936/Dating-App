import 'package:stroll_social_assignment/features/task3/data/models/scrolled_position.dart';
import '../../../data/models/users.dart';

class GestureState {
  int? selectedIndex;
  Users users;
  ScrolledPosition position = ScrolledPosition(0, 0);
  double videoHeight = 1;
  double videoWidth = 1;

  GestureState({
    required this.users,
    required this.selectedIndex,
    required this.position,
    required this.videoHeight,
    required this.videoWidth,
  });

  GestureState copyWith(
      {Users? users,
      int? selectedIndex,
      ScrolledPosition? position,
      double? videoHeight,
      double? videoWidth}) {
    return GestureState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      users: users ?? this.users,
      position: position ?? this.position,
      videoHeight: videoHeight ?? this.videoHeight,
      videoWidth: videoWidth ?? this.videoWidth,
    );
  }
}
