import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_with_clean_arch/core/error/failure.dart';
import 'package:todo_app_with_clean_arch/core/platform/network_info.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../datasources/todo_local_data_source.dart';

class TaskRepositoryImp extends Equatable implements TaskRepository {
  final TodoLocalDataSource todoLocalDataSource;
  final NetworkInfo networkInfo;

  const TaskRepositoryImp({
    required this.todoLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TaskEntity>> createTask(TaskEntity task) async {
    networkInfo.isConnected;
    try {
      final createdTask = await todoLocalDataSource.createTask(task);
      return Right(createdTask);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(String taskId) async {
    networkInfo.isConnected;
    try {
      todoLocalDataSource.deleteTask;
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> updateTask(
      String taskId, TaskEntity task) async {
    networkInfo.isConnected;
    try{  
      final updatedTask = await todoLocalDataSource.updateTask(taskId, task);
      return Right(updatedTask);
    } on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> viewAllTask() async{
    networkInfo.isConnected;
    try{
      final results = await todoLocalDataSource.viewAllTasks();
      return Right(results);
    }on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> viewSpecificTask(String taskId) async{
    networkInfo.isConnected;
    try{
      final results = await todoLocalDataSource.viewSpecificTask(taskId);
      return Right(results);
    }on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  List<Object?> get props => [todoLocalDataSource, networkInfo];
}
