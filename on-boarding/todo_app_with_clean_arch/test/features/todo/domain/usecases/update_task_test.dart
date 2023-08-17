import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/usecases/update_task.dart';

import 'creat_task_test.mocks.dart';

@GenerateMocks([TaskRepository])

void main(){
  late MockTaskRepository mockTaskRepository;
  late UpdateTask usecase;

  setUp((){
    mockTaskRepository = MockTaskRepository();
    usecase = UpdateTask(mockTaskRepository);
  });

    const String id = "1";

    final task = TaskEntity(
      taskId: 1,
      taskTitle: 'Test',
      taskDescription: 'test descri',
      taskDueDate: DateTime.now().toString(),
      taskStatus: false);

  test("this should update the task", () async{

    when(mockTaskRepository.updateTask(id,task)).thenAnswer((_) async => Right(task));

    final result = await usecase(Params(id: id, task: task));

    expect(result, Right(task));

    verify(mockTaskRepository.updateTask(id,task));
    verifyNoMoreInteractions(mockTaskRepository);
  });

}
