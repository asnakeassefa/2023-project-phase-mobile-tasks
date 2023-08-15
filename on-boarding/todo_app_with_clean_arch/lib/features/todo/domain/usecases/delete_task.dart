import 'package:dartz/dartz.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';

class DeleteTask{
  final TaskRepository repository;

  DeleteTask(this.repository);

  Future<Either<Failure,void>> call({required String taskId}) async{
    return repository.deleteTask(taskId);
  }
}