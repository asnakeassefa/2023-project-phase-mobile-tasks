import 'package:dartz/dartz.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';

import '../../../../core/error/failure.dart';

abstract class TaskRepository{
  Future<Either<Failure,TaskEntity>> createTask(TaskEntity task);
  Future<Either<Failure,List<TaskEntity>>> viewAllTask();
  Future<Either<Failure,TaskEntity>> viewSpecificTask(String taskId);
  Future<Either<Failure,TaskEntity>> updateTask(String taskId,TaskEntity task);
  Future<Either<Failure,void>> deleteTask(String taskId);
}