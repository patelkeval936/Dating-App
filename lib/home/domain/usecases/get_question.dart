
import '../../../core/result_state_implementation.dart';
import '../../../core/usecase_template.dart';
import '../repositories/data_fetch_repository.dart';

class GetQuestion implements UseCase<ResultState, Params> {
  final DataFetchRepository _dataFetchRepo;

  GetQuestion(this._dataFetchRepo);

  @override
  Future<ResultState> call(Params params) {
    return _dataFetchRepo.getQuestion(params.src);
  }
}

