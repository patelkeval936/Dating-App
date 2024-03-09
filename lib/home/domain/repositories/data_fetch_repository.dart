import '../../../core/result_state_implementation.dart';

abstract class DataFetchRepository {
  Future<ResultState> getHeaderInfo(String src);
  Future<ResultState> getUserInfo(String src);
  Future<ResultState> getQuestion(String src);
}
