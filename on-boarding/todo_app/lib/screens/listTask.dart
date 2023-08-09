import 'package:flutter/material.dart';
import 'package:todo_app/Models/TasksModel.dart';
import 'package:todo_app/screens/createTask.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/showDetails.dart';

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

    // date formater
    final dateFormat = DateFormat("MMM. d, y");

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

                //Task List buider
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final item = tasks[index];
                      return Card(
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 10,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const ShowDetail();
                                },
                              ),
                            );
                          },
                          leading: Text(
                            item.taskName[0],
                            style: const TextStyle(fontSize: 25),
                          ),
                          title: Text(item.taskName),
                          subtitle: Text(item.description),
                          trailing: SizedBox(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(dateFormat.format(DateTime.now())),
                                const SizedBox(width: 10),
                                Container(
                                  width: 2,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffEE6F57),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(256, 39),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: const Color(0xffEE6F57),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CreateTask();
                      },
                    ),
                  ),
                  child: const Text(
                    "create Task",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )),
    );
  }
}
