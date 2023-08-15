import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable{
  final int taskId;
  final String taskTitle;
  final String taskDueDate;
  final String taskDescription;
  final bool taskStatus;

  const TaskEntity({
    required this.taskId,
    required this.taskTitle,
    required this.taskDueDate,
    required this.taskDescription,
    required this.taskStatus,
  });
  
  @override
  List<Object?> get props => [taskId,taskTitle,taskDueDate,taskDescription,taskStatus];
}
