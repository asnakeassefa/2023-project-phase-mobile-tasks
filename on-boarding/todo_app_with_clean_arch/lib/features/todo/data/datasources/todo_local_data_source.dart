
import 'package:todo_app_with_clean_arch/features/todo/data/models/task_model.dart';

abstract class TodoLocalDataSource{

  Future<TaskModel> addTask();

  Future<TaskModel> getTask(String id);
  
  Future<List<TaskModel>> getAllTasks();
}