import '../../../core/result_state_implementation.dart';
import '../../../core/usecase_template.dart';
import '../repositories/data_fetch_repository.dart';

class GetUser implements UseCase<ResultState, Params> {
  final DataFetchRepository _dataFetchRepo;

  GetUser(this._dataFetchRepo);

  @override
  Future<ResultState> call(Params params) {
    return _dataFetchRepo.getUserInfo(params.src);
  }
}

