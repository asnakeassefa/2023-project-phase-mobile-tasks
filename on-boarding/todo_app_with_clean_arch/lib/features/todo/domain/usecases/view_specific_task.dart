import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:todo_app_with_clean_arch/core/error/failure.dart';
import 'package:todo_app_with_clean_arch/core/usecases/usecase.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';

class ViewSpecificTask extends usecases<TaskEntity,Params> {
  final TaskRepository repository;

  ViewSpecificTask(this.repository);
  
  @override
  Future<Either<Failure, TaskEntity>> call(Params params) async {
    return await repository.viewSpecificTask(params.id);
  }

}


class Params extends Equatable{
  final String id;
  const Params({required this.id});

  @override
  List<Object?> get props => [id];
}