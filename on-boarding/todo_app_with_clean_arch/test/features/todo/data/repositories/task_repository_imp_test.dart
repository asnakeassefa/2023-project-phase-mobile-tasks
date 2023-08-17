import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app_with_clean_arch/core/error/exceptions.dart';
import 'package:todo_app_with_clean_arch/core/error/failure.dart';
import 'package:todo_app_with_clean_arch/core/platform/network_info.dart';
import 'package:todo_app_with_clean_arch/features/todo/data/datasources/todo_local_data_source.dart';
import 'package:todo_app_with_clean_arch/features/todo/data/models/task_model.dart';
import 'package:todo_app_with_clean_arch/features/todo/data/repositories/task_repository_imp.dart';

import 'task_repository_imp_test.mocks.dart';

@GenerateMocks([NetworkInfo, TodoLocalDataSource])
void main() {
  late TaskRepositoryImp repository;
  late MockNetworkInfo mockNetworkInfo;
  late MockTodoLocalDataSource mockTodoLocalDataSource;

  setUp(() async {
    mockNetworkInfo = MockNetworkInfo();
    mockTodoLocalDataSource = MockTodoLocalDataSource();
    repository = TaskRepositoryImp(
      todoLocalDataSource: mockTodoLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  const int taskId = 1;
  const TaskModel task = TaskModel(
      taskId: taskId,
      taskTitle: "taskTitle",
      taskDueDate: "taskDueDate",
      taskDescription: "taskDescription",
      taskStatus: false);
  // const List tasks = [task];
  group("device is offline", () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });

    test("should access create task in datalayer", () async {
      when(mockTodoLocalDataSource.createTask(task))
          .thenAnswer((_) async => task);
      final result = await repository.createTask(task);

      verify(mockTodoLocalDataSource.createTask(task)).called(1);

      expect(result, equals(const Right(task)));
    });

    test('should return CacheFailure when there is no cached data present', () async {
      

    when(mockTodoLocalDataSource.createTask(task)).thenThrow(CacheException());

    final result = await repository.createTask(task);


    verify(mockTodoLocalDataSource.createTask(task)).called(1);
    expect(result, equals(Left(CacheFailure())));
    });

  });
}
