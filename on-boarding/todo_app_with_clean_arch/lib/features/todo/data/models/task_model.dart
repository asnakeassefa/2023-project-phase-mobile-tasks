import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  final int taskId;
  final String taskTitle;
  final String taskDueDate;
  final String taskDescription;
  final bool taskStatus;

  const TaskModel({
    required this.taskId,
    required this.taskTitle,
    required this.taskDueDate,
    required this.taskDescription,
    required this.taskStatus,
  }) : super(
            taskId: taskId,
            taskTitle: taskTitle,
            taskDueDate: taskDueDate,
            taskDescription: taskDescription,
            taskStatus: taskStatus);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        taskId: json['taskId'],
        taskTitle: json['taskTitle'],
        taskDueDate: json['taskDueDate'],
        taskDescription: json['taskDescription'],
        taskStatus: json['taskStatus']);
  }

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'taskTitle': taskTitle,
      'taskDueDate': taskDueDate,
      'taskDescription': taskDescription,
      'taskStatus': taskStatus,
    };
  }
}
