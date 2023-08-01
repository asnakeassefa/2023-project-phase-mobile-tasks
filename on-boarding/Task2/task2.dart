import 'dart:io';

void main(){
  bool end = true;
  while (end){
    print("please select the from the menus");
    print("1.Add a new task");
    print('2.view all tasks');
    print("3.view only complited tasks");
    print('4.view only pending tasks');
    print('5. edit tasks');
    print('6. Delete Task');

    var selected = stdin.readLineSync();
    TaskManager taskManager = TaskManager();
    switch(selected){
      case "1":
        taskManager.addTask();
        taskManager.ViewTasks();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if(val == "1") end = false;
        break;
      case '2':
        taskManager.ViewTasks();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if(val == "1") end = false;
        break;
      case '3':
        taskManager.complitedTasks();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if(val == "1") end = false;
        break;
      case '4':
        taskManager.pendingTasks();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if(val == "1") end = false;
        break;
      case '5':
        taskManager.editTask();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if(val == "1") end = false;
        break;
      case '6':
        taskManager.deleteTask();
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if(val == "1") end = false;
        break;
      default:
        print('choise is not available');
        print("if you want to leave press 1 else press any key");
        String? val = stdin.readLineSync();
        if(val == "1") end = false;
    }}
}
// task model
class Task{
  String? task;
  String? Discription;
  DateTime DueDate;
  bool Status;
  // constructor of the class
  Task(this.task, this.Discription, this.DueDate, this.Status);
  
}

class TaskManager{
  
  List<Task> Data = [];

  void addTask(){

    String? taskTitle;
    String? Discription;
    String Date;
    bool status;

    print('Enter Task Title');
    taskTitle = stdin.readLineSync();
    print('Enter your discription');
    Discription = stdin.readLineSync();
    print('Enter due date in days');
    taskTitle = stdin.readLineSync();

    var value = Task(taskTitle, Discription, DateTime.now(),false);

    Data.add(value);
  }

  void ViewTasks()async{
    for (final val in Data){
      print("title: " + val.task!);
      print("Discription: " + val.Discription!);
      print("due date: "+ val.DueDate.toString());
      print("is done: " + val.Status.toString());

    }
  }

  void complitedTasks(){
    var newData = Data.where((element) => element.Status == true).toList();
   for (final val in newData){
      print("title: " + val.task!);
      print("Discription: " + val.Discription!);
      print("due date: "+ val.DueDate.toString());
      print("is done: " + val.Status.toString());

    }
  }

  void pendingTasks(){
    var newData = Data.where((element) => element.Status == false).toList();
    for (final val in newData){
      print("title: " + val.task!);
      print("Discription: " + val.Discription!);
      print("due date: "+ val.DueDate.toString());
      print("is done: " + val.Status.toString());

    }
  }

  void editTask(){
    String? name = stdin.readLineSync();
    int index = Data.indexWhere((element) => element.task == name);

    String? taskTitle;
    String? Discription;
    String Date;
    String? status;

    print('Enter Task Title');
    taskTitle = stdin.readLineSync();
    print('Enter your discription');
    Discription = stdin.readLineSync();
    print('Enter due date in days');
    taskTitle = stdin.readLineSync();
    print("if the task is done press 1");
    status = stdin.readLineSync();

    bool state = false;

    if (status == "1"){
      state = true;
    }
    // editing the task
    Data[index].task = taskTitle;
    Data[index].Discription = Discription;
    Data[index].DueDate = DateTime.now();
    Data[index].Status = state;

    print(Data[index]);
  }

  void deleteTask(){
    String? taskTitle;
    print('Enter Task Title');
    taskTitle = stdin.readLineSync();
    var item = Data.where((element) => element.task == taskTitle);
    if (item.length == 0){
      print("Task is not availale");
    } else{
    Data.removeWhere((element) => element.task == taskTitle);
    print("Task is deleted");}
  }
}