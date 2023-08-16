

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_with_clean_arch/core/error/failure.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';

abstract class usecases<Type, Params>{
  Future<Either<Failure,TaskEntity>> call(Params params);
}

class NoParam extends Equatable{
  @override
  List<Object?> get props => [];
}