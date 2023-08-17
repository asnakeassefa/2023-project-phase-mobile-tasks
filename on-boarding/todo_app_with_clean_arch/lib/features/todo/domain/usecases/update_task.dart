import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_with_clean_arch/core/usecases/usecase.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/task_entity.dart';

class UpdateTask extends usecases<TaskEntity, Params>{
  final TaskRepository repository;

  UpdateTask(this.repository);
  
  @override
  Future<Either<Failure, TaskEntity>> call(Params params) async{
    return await repository.updateTask(params.id, params.task);
  }

}

class Params extends Equatable{
  final String id;
  final TaskEntity task;
  const Params({required this.id, required this.task});

  @override
  List<Object?> get props => [id,task];
  
}