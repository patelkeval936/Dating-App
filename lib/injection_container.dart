import 'package:get_it/get_it.dart';
import 'package:record/record.dart';
import 'features/task1/data/data_sources/local_json_service.dart';
import 'features/task1/data/repositories/data_fetch_repo_implementation.dart';
import 'features/task1/domain/repositories/data_fetch_repository.dart';
import 'features/task1/domain/usecases/get_header.dart';
import 'features/task1/domain/usecases/get_question.dart';
import 'features/task1/domain/usecases/get_user.dart';
import 'features/task1/presentation/bloc/header_bloc/header_bloc.dart';
import 'features/task1/presentation/bloc/question_bloc/question_bloc.dart';
import 'features/task1/presentation/bloc/user_bloc/user_bloc.dart';
import 'features/task2/presentation/recorder_bloc/recorder_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Dependencies
  sl.registerSingleton<LocalJsonFetchService>(LocalJsonFetchService());

  DataFetchRepository repo = sl.registerSingleton<DataFetchRepositoryImpl>(
      DataFetchRepositoryImpl(localJsonClient: sl()));

  //UseCases
  sl.registerSingleton<GetHeader>(GetHeader(repo));

  sl.registerSingleton<GetUser>(GetUser(repo));

  sl.registerSingleton<GetQuestion>(GetQuestion(repo));

  //Blocs
  sl.registerSingleton<HeaderBloc>(HeaderBloc(sl()));

  sl.registerSingleton<UserBloc>(UserBloc(sl()));

  sl.registerSingleton<QuestionBloc>(QuestionBloc(sl()));

  sl.registerSingleton<AudioRecorder>(AudioRecorder());

  sl.registerSingleton<RecorderBloc>(RecorderBloc(sl()));


}
