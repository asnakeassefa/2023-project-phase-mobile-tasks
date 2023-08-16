import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/entities/task_entity.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/repositories/task_repository.dart';
import 'package:todo_app_with_clean_arch/features/todo/domain/usecases/view_all_tasks.dart';

import 'creat_task_test.mocks.dart';

@GenerateMocks([TaskRepository])

void main(){

  late MockTaskRepository mockTaskRepository;
  late ViewAllTasks usecase;


  setUp((){
    mockTaskRepository = MockTaskRepository();
    usecase = ViewAllTasks(mockTaskRepository);
  });

 final List<TaskEntity> task =[TaskEntity(
      taskId: 1,
      taskTitle: 'Test',
      taskDescription: 'test descri',
      taskDueDate: DateTime.now().toString(),
      taskStatus: false)];


  test("it displays all tasks", () async{

    when(mockTaskRepository.viewAllTask()).thenAnswer((_) async => Right(task));

    final result = await usecase();

    expect(result, Right(task));

    verify(mockTaskRepository.viewAllTask());

    verifyNoMoreInteractions(mockTaskRepository);
  });

}