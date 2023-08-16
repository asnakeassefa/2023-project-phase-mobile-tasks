import 'package:dartz/dartz.dart';
import 'package:todo_app_with_clean_arch/core/error/failure.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';

class ViewAllTasks{
  final TaskRepository repository;

  ViewAllTasks(this.repository);
  
  Future<Either<Failure,List<TaskEntity>>> call() async{
    return await repository.viewAllTask();
  }

}