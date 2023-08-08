import 'package:flutter/material.dart';
import 'package:flutterui/Models/TasksModel.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});
  @override
  Widget build(BuildContext context) {

    List tasks = <TaskModel>[
      TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
          TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
          TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
          TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
          TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
          TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
          TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
          TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
          TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
          TaskModel(
          taskName: "UI/UX team",
          dueDate: DateTime.now(),
          description: "hello"),
    ];

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
            ),
            title: const Center(child: Text("Todo list")),
            actions: [
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.more_vert_outlined))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // image
                Image.asset("assets/images/stickman_todo_list.png"),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Tasks list',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                  ],
                ),
                // Text Field to add tasks
                
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(256, 39),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ListPage();
                      },
                    ),
                  ),
                  child: const Text(
                    "create Task",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
