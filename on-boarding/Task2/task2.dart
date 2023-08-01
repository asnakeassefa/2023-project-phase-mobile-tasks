import 'dart:io';

void main() {
  bool end = true;
  TaskManager taskManager = TaskManager();
  while (end) {
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
        taskManager.ViewTasks();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if (val == "1") end = false;
        break;
      case '2':
        taskManager.ViewTasks();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if (val == "1") end = false;
        break;
      case '3':
        taskManager.complitedTasks();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if (val == "1") end = false;
        break;
      case '4':
        taskManager.pendingTasks();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if (val == "1") end = false;
        break;
      case '5':
        taskManager.editTask();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if (val == "1") end = false;
        break;
      case '6':
        taskManager.deleteTask();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if (val == "1") end = false;
        break;
      default:
        print('choise is not available');
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if (val == "1") end = false;
    }
  }
}

// task model
class Task {
  String? task;
  String? Discription;
  DateTime? DueDate;
  bool Status;
  // constructor
  Task(this.task, this.Discription, this.DueDate, this.Status);
}

class TaskManager {
  List<Task> Data = [];

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



  void addTask() {
    Task getTask = getData();
    Data.add(getTask);
  }

  void ViewTasks() async {
    for (final val in Data) {
      print("title: " + val.task!);
      print("Discription: " + val.Discription!);
      print("due date: " + val.DueDate.toString());
      print("is done: " + (val.Status ? "complited" : "pending"));
      print("");
    }
  }

  void complitedTasks() {
    var newData = Data.where((element) => element.Status == true).toList();
    for (final val in newData) {
      print("title: " + val.task!);
      print("Discription: " + val.Discription!);
      print("due date: " + val.DueDate.toString());
      print("is done: " + (val.Status ? "complited" : "pending"));
    }
  }

  void pendingTasks() {
    var newData = Data.where((element) => element.Status == false).toList();
    for (final val in newData) {
      print("title: " + val.task!);
      print("Discription: " + val.Discription!);
      print("due date: " + val.DueDate.toString());
      print("is done: " + (val.Status ? "complited" : "pending"));
    }
  }


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
