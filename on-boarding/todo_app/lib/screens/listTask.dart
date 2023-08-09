import 'package:flutter/material.dart';
import 'package:todo_app/Models/TasksModel.dart';
import 'package:todo_app/screens/createTask.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/screens/showDetails.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static List tasks = <TaskModel>[];
  
// animation route
  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CreateTask(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                                  return ShowDetail(
                                    title: item.taskName,
                                    description: item.description,
                                    dueDate: dateFormat.format(DateTime.now()),
                                  );
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
                                Text(item.dueDate),
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
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      createRoute(),
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          tasks.add(value);
                        });
                      }
                    });
                  },
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
