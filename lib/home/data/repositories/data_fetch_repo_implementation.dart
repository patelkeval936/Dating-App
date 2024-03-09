
import 'package:stroll_social_assignment/core/result_state_implementation.dart';
import 'package:stroll_social_assignment/home/data/models/header_info_model.dart';
import 'package:stroll_social_assignment/home/data/models/question_model.dart';
import 'package:stroll_social_assignment/home/data/models/user_info_model.dart';
import 'package:stroll_social_assignment/home/domain/repositories/data_fetch_repository.dart';
import '../data_sources/local_json_service.dart';

class DataFetchRepositoryImpl implements DataFetchRepository {
  final LocalJsonFetchService _localJsonService;

  DataFetchRepositoryImpl({
    required LocalJsonFetchService localJsonClient,
  }) : _localJsonService = localJsonClient;

  @override
  Future<ResultState> getHeaderInfo(String src) async {
    try {
      final jsonResult = await _localJsonService.getLocalData(src);

      HeaderInfoModel headerInfoModel = HeaderInfoModel.fromJson(jsonResult);

      return Success<HeaderInfoModel>(headerInfoModel);
    } catch (e) {
      return Failure(ApiException(message: e.toString()));
    }
  }

  @override
  Future<ResultState> getQuestion(String src) async {
    try {
      final jsonResult = await _localJsonService.getLocalData(src);
      QuestionModel questionModel = QuestionModel.fromJson(jsonResult);
      return Success<QuestionModel>(questionModel);
    } catch (e) {
      return Failure(ApiException(message: e.toString()));
    }
  }

  @override
  Future<ResultState> getUserInfo(String src) async {
    try {
      final jsonResult = await _localJsonService.getLocalData(src);
      UserInfoModel userInfoModel = UserInfoModel.fromJson(jsonResult);
      return Success<UserInfoModel>(userInfoModel);
    } catch (e) {
      return Failure(ApiException(message: e.toString()));
    }
  }
}
