import 'package:flutter/material.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
          ),
          actions: [
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.more_vert_outlined))
          ],
        ),
        bottomNavigationBar: const BottomAppBar(
          child: Center(
            child: Text(
              'Create new task',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // body part
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                ],
              ),

              // Text fields for the input
              ListView(
                
              ),

              // Add task button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(256, 39),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.red,
                ),
                onPressed: () {},
                child: const Text("Add Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
