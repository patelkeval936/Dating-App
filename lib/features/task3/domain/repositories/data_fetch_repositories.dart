
import '../../../../core/result_state_implementation.dart';

abstract class UsersFetchRepository {
  Future<ResultState> getUsersInfo(String src);
}
