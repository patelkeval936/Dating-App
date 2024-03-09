import 'package:equatable/equatable.dart';

class NoParams {}

abstract class UseCase<T, P> {
  Future<T> call(P params);
}

class Params extends Equatable {
  final String src;

  const Params(this.src);

  @override
  List<Object?> get props => [src];
}


