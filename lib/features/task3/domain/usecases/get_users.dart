import 'package:stroll_social_assignment/features/task3/domain/repositories/data_fetch_repositories.dart';
import '../../../../core/result_state_implementation.dart';
import '../../../../core/usecase_template.dart';

class GetUsers implements UseCase<ResultState, Params> {
  final UsersFetchRepository _dataFetchRepo;

  GetUsers(this._dataFetchRepo);

  @override
  Future<ResultState> call(Params params) {
    return _dataFetchRepo.getUsersInfo(params.src);
  }
}
