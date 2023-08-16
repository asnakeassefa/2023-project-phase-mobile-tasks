import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_with_clean_arch/features/todo/data/models/task_model.dart';

void main() {
  TaskModel task = const TaskModel(
      taskId: 1,
      taskTitle: 'taskTitle',
      taskDueDate: '2023-08-16',
      taskDescription: 'taskDescription',
      taskStatus: false);

  final json = {
    "taskId": 1,
    'taskTitle': 'taskTitle',
    'taskDueDate': "2023-08-16",
    'taskDescription': 'taskDescription',
    'taskStatus': false
  };
  test('Should return a valid model with the valid json file', () async {
    final result = TaskModel.fromJson(json);

    expect(result, isA<TaskModel>());
  });

  test('should return a json file', ()async{
    final result = task.toJson();

    expect(result, json);
  });
}
