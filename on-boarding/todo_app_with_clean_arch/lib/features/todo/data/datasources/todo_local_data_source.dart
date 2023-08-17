
import 'package:todo_app_with_clean_arch/features/todo/data/models/task_model.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';

abstract class TodoLocalDataSource{

  Future<TaskModel> createTask(TaskEntity task);
  Future<TaskModel> viewSpecificTask(String id);
  Future<List<TaskModel>> viewAllTasks();
  Future<void> deleteTask(String id);
  Future<TaskModel> updateTask(String id, TaskEntity task);
}
