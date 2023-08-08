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

        // body part
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Text(
                'Create new task',
                style: TextStyle(
                    color: Color(0xff2c2c2c),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.grey))),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Main task name",
                          style: TextStyle(
                            color: Color(0xffEE6F57),
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Title field
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(blurRadius: 5, color: Colors.grey),
                              ]),
                          height: 60,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Write title here",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        const Text(
                          "Due date",
                          style: TextStyle(
                            color: Color(0xffEE6F57),
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // due date
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(blurRadius: 5, color: Colors.grey),
                            ],
                          ),
                          height: 60,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Write title here",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        // Description text field
                        const Text(
                          "Description",
                          style: TextStyle(
                            color: Color(0xffEE6F57),
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Title field
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(blurRadius: 5, color: Colors.grey),
                            ],
                          ),
                          height: 150,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "description",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Add task button
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 70),
                        decoration: const BoxDecoration(
                            color: Color(0xffEE6757),
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        child: const Center(
                          child: Text(
                            'Add Task',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
