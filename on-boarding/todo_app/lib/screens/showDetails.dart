import 'package:flutter/material.dart';

class ShowDetail extends StatelessWidget {
  final String title;
  final String description;
  final String dueDate;
  const ShowDetail(
      {super.key,
      required this.title,
      required this.description,
      required this.dueDate});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 212, 209, 209),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
          ),
          title: const Center(child: Text("Task Detail")),
          actions: [
            IconButton(
                onPressed: () => {}, icon: const Icon(Icons.more_vert_outlined))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset("assets/images/shopping_list.png"),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: [
                    // Title
                    const Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomCard(
                      height: 60,
                      child: Row(
                        children: [
                          Text(title),
                        ],
                      ),
                    ),

                    // description
                    const SizedBox(height: 20),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    CustomCard(
                      height: 140,
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            description,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                    // dead line
                    const SizedBox(height: 20),
                    const Text(
                      "Deadline",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    CustomCard(
                      height: 60,
                      child: Row(
                        children: [
                          Text(dueDate),
                        ],
                      ),
                    ),
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

class CustomCard extends StatelessWidget {
  final Widget child;
  final double height;
  const CustomCard({super.key, required this.child, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: child,
      ),
    );
  }
}
