import 'dart:io';
import 'taskManager.dart';

void main() {
  String? end = "1";
  TaskManager taskManager = TaskManager();
  do {
    print("please select the from the menus");
    print("1.Add a new task");
    print('2.view all tasks');
    print("3.view only complited tasks");
    print('4.view only pending tasks');
    print('5. edit tasks');
    print('6. Delete Task');
    var selected = stdin.readLineSync();

    switch (selected) {
      case "1":
        taskManager.addTask();
        break;
      case '2':
        taskManager.ViewTasks();
        break;
      case '3':
        taskManager.complitedTasks();
        break;
      case '4':
        taskManager.pendingTasks();
        break;
      case '5':
        taskManager.editTask();
        break;
      case '6':
        taskManager.deleteTask();
        break;
      default:
        print('choise is not available');
    }
    print("do you want to continue?  1: yes or 2: No");
    end = stdin.readLineSync()!;
    if (end.isEmpty){
      end = "1";
    }
  } while (end != "2");
}
