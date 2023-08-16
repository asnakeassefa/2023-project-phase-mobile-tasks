import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/usecases/view_specific_task.dart';

import 'creat_task_test.mocks.dart';

// class MockCreateTaskRepository extends Mock implements TaskRepository {}

@GenerateMocks([TaskRepository])

void main(){

  late MockTaskRepository mockTaskRepository;
  late ViewSpecificTask usecase;

  setUp((){
    mockTaskRepository = MockTaskRepository();
    usecase = ViewSpecificTask(mockTaskRepository);
  });

  final String id = "1";

   final task = TaskEntity(
      taskId: 1,
      taskTitle: 'Test',
      taskDescription: 'test descri',
      taskDueDate: DateTime.now().toString(),
      taskStatus: false);


  test("it gets a task by its id", () async {

    when(mockTaskRepository.viewSpecificTask(id)).thenAnswer((_) async=> Right(task));

    final result = await usecase(Params(id: id));

    expect(result,Right(task));

    verify(mockTaskRepository.viewSpecificTask(id));
    verifyNoMoreInteractions(mockTaskRepository);

  });

}