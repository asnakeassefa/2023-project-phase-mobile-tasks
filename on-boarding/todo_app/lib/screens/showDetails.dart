import 'package:flutter/material.dart';

class ShowDetail extends StatelessWidget {
  const ShowDetail({super.key});

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
                  children: const [
                    // Title
                    Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomCard(
                      height: 60,
                      child: Row(
                        children: [
                          Text("The title"),
                        ],
                      ),
                    ),

                    // description
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),

                    CustomCard(
                      height: 140,
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'How much wood would a woodchuck chuck if a woodchuck could chuck wood?',
                            softWrap: true,
                          ),
                        ),
                      ),
                    ),
                    // dead line
                    SizedBox(height: 20),
                    Text(
                      "Deadline",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    CustomCard(
                      height: 60,
                      child: Row(
                        children: [
                          Text("April. 13, 2023"),
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
