import 'package:flutter/material.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.red),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(alignment: const Alignment(0,-0.75),child: Image.asset("assets/images/paint.png")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: const Alignment(0, 0.85),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(256, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: const Color(0xff0C8CE9),
                ),
                onPressed: () => Navigator.pushNamed((context),"/tasklist"),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
