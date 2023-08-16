import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/usecases/create_task.dart';

import 'creat_task_test.mocks.dart';

// class MockCreateTaskRepository extends Mock implements TaskRepository {}

@GenerateMocks([TaskRepository])
void main() {
  late CreateTask usecases;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    usecases = CreateTask(mockTaskRepository);
  });

  final task = TaskEntity(
      taskId: 1,
      taskTitle: 'Test',
      taskDescription: 'test descri',
      taskDueDate: DateTime.now().toString(),
      taskStatus: false);

  test("Create the data", () async {
    when(mockTaskRepository.createTask(task))
        .thenAnswer((_) async => Right(task));

    final result = await usecases(Params(taskEntity: task));

    expect(result, Right(task));

    verify(mockTaskRepository.createTask(task));

    verifyNoMoreInteractions(mockTaskRepository);
  });
}
