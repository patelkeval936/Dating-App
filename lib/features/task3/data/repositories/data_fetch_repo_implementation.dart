import 'package:stroll_social_assignment/core/result_state_implementation.dart';
import 'package:stroll_social_assignment/features/task3/domain/repositories/data_fetch_repositories.dart';
import '../data_sources/local_json_service.dart';
import '../models/users.dart';

class UserFetchRepositoryImpl implements UsersFetchRepository {
  final UsersJsonFetchService _localJsonService;

  UserFetchRepositoryImpl({
    required UsersJsonFetchService localJsonClient,
  }) : _localJsonService = localJsonClient;

  @override
  Future<ResultState> getUsersInfo(String src) async {
    try {
      final jsonResult = await _localJsonService.getLocalData(src);

      Users users = Users.fromJson(jsonResult);

      return Success<Users>(users);
    } catch (e) {
      return Failure(ApiException(message: e.toString()));
    }
  }
}
