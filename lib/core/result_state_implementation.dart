abstract class ResultState<T> {
  final T? data;
  final ApiException? error;

  const ResultState({this.data, this.error});
}

class Success<T> extends ResultState<T> {
  final T value;

  const Success(this.value) : super(data: value);
}

class Failure extends ResultState {
  final ApiException value;

  const Failure(this.value) : super(error: value);
}

class ApiException implements Exception {
  final int? code;
  final String? message;

  ApiException({this.code, this.message});
}