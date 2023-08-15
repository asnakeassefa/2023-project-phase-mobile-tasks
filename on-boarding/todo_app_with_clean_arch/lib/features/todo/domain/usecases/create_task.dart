import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_with_clean_arch/core/error/failure.dart';
import 'package:todo_app_with_clean_arch/core/usecases/usecase.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';

class CreateTask extends usecases<TaskEntity,Params>{
  final TaskRepository repository;

  CreateTask(this.repository);
  
  @override
  Future<Either<Failure, TaskEntity>> call(Params params) async {
    return await repository.createTask(params.taskEntity);
  }

}

class Params extends Equatable{
  final TaskEntity taskEntity;
  const Params({required this.taskEntity});
  
  @override
  List<Object?> get props => [taskEntity];
}