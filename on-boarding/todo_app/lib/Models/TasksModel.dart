class TaskModel {
  final String taskName;
  final DateTime dueDate;
  final String description;

  const TaskModel(
      {required this.taskName,
      required this.dueDate,
      required this.description});
}
