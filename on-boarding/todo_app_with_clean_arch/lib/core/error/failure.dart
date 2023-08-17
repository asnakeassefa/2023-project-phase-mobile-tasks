import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final List properties;
  const Failure([this.properties = const <dynamic>[]]);
}

class CacheFailure extends Failure{
  @override
  List<Object?> get props =>[];
}