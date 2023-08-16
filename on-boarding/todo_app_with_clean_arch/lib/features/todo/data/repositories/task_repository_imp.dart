

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_with_clean_arch/core/error/failure.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';

class TaskRepositoryImp extends Equatable implements TaskRepository{
  @override
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> deleteTask(String taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  Future<Either<Failure, TaskEntity>> updateTask(String taskId) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<TaskEntity>>> viewAllTask() {
    // TODO: implement viewAllTask
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, TaskEntity>> viewSpecificTask(String taskId) {
    // TODO: implement viewSpecificTask
    throw UnimplementedError();
  }
  
}