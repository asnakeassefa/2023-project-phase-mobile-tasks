import 'dart:io';

import 'Model/taskModel.dart';


class TaskManager {
  List<Task> Data = [];
  // method to recive user data
    Task getData() {
    String? taskTitle;
    String? Discription;
    DateTime? date;
    String? status;

    print('Enter Task Title');
    taskTitle = stdin.readLineSync();
    print('Enter your discription');
    Discription = stdin.readLineSync();
    print("New task due date (yyyy-mm-dd):");
    var dueDate = stdin.readLineSync()!;
    print("Is the project complited(1) or in progress(0)");
    status = stdin.readLineSync();

    bool state = false;

    if (dueDate.isNotEmpty) {
      var dueDateParsed = DateTime.tryParse(dueDate);

      if (dueDateParsed == null) {
        print("Invalid date format.");
      } else {
        date = dueDateParsed;
      }
    }

    if (status == "1") {
      state = true;
    }

    var value = Task(taskTitle, Discription, date, state);
    return value;
  }

// adding task
  void addTask() {
    Task getTask = getData();
    Data.add(getTask);
  }

// diplay all tasks
  void ViewTasks() async {
    for (final val in Data) {
      print("title: " + val.task!);
      print("Discription: " + val.Discription!);
      print("due date: " + val.DueDate.toString());
      print("is done: " + (val.Status ? "complited" : "pending"));
      print("");
    }
  }

// display complited tasks
  void complitedTasks() {
    var newData = Data.where((element) => element.Status == true).toList();
    for (final val in newData) {
      print("title: " + val.task!);
      print("Discription: " + val.Discription!);
      print("due date: " + val.DueDate.toString());
      print("is done: " + (val.Status ? "complited" : "pending"));
    }
  }

// display pendings
  void pendingTasks() {
    var newData = Data.where((element) => element.Status == false).toList();
    for (final val in newData) {
      print("title: " + val.task!);
      print("Discription: " + val.Discription!);
      print("due date: " + val.DueDate.toString());
      print("is done: " + (val.Status ? "complited" : "pending"));
    }
  }

// edit method
  void editTask() {
    print("please enter the title");
    String? name = stdin.readLineSync();
    int index = Data.indexWhere((element) => element.task == name);
    if (index >= 0) {
      Task userData = getData();
      // editing the task
      Data[index].task = userData.task;
      Data[index].Discription = userData.Discription;
      Data[index].DueDate = userData.DueDate;
      Data[index].Status = userData.Status;

      print('edited list');
      print("title: " + Data[index].task!);
      print("Discription: " + Data[index].Discription!);
      print("due date: " + Data[index].DueDate.toString());
      print("is done: " + (Data[index].Status ? "complited" : "pending"));
      // end of if
    } else {
      print('task is not available');
    }
  }

// delete method
  void deleteTask() {
    String? taskTitle;
    print('Enter Task Title');
    taskTitle = stdin.readLineSync();
    var item = Data.where((element) => element.task == taskTitle);
    if (item.length == 0) {
      print("Task is not availale");
    } else {
      Data.removeWhere((element) => element.task == taskTitle);
      print("Task is deleted");
    }
  }
}
