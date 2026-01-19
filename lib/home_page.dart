import 'package:dart_lesson/lesson_pages/for_while_loops.dart';
import 'package:dart_lesson/lesson_pages/second_page.dart';
import 'package:dart_lesson/lesson_pages/ternary_operators.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart and Flutter Lessons'),
        backgroundColor: Colors.teal[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondLesson(),
                    ),
                  );
                },

                child: const Text('1-сабак: Dart Language Basics - Variables'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThirdLessonPage(),
                    ),
                  );
                },
                child: const Text(
                  '2-сабак: Dart Language Basics - Ternary Operators',
                ),
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoopsMasterPage(),
                    ),
                  );
                },
                child: const Text(
                  '3-сабак: Dart Language Basics - for жана while циклдер',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
