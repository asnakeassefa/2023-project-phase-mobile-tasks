import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      if (_counter == 10) {
        _counter = 0;
      } else {
        _counter += 1;
      }
    });
  }

  void decrimentCounter() {
    setState(() {
      if (_counter == 0) {
        _counter = 10;
      } else {
        _counter -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          //incriment button
          FloatingActionButton(
            onPressed: incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),

          // decriment button
          FloatingActionButton(
            onPressed: decrimentCounter,
            tooltip: 'decrement',
            child: const Icon(Icons.minimize_outlined),
          ),
        ],
      ),
    );
  }
}
