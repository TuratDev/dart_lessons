import 'package:dart_lesson/lesson_pages/classes_objects_ui.dart';
import 'package:dart_lesson/lesson_pages/cycle_game_page.dart';
import 'package:dart_lesson/lesson_pages/data_structures_page.dart';
import 'package:dart_lesson/lesson_pages/for_while_loops.dart';
import 'package:dart_lesson/lesson_pages/functions_master_page.dart';
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

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CycleGamePage(),
                    ),
                  );
                },
                child: const Text(
                  '3-сабак: 3-сабак уландысы: Dart Language Basics - Оюн цикли',
                ),
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FunctionsMasterPage(),
                    ),
                  );
                },
                child: const Text(
                  '4-сабак: Dart Language Basics - Functions Master Page',
                ),
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DataStructuresPage(),
                    ),
                  );
                },
                child: const Text(
                  '5-сабак: Dart Language Basics - Data Structures Page',
                ),
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OOPMasterPage(),
                    ),
                  );
                },
                child: const Text(
                  '6-сабак: Dart Language Basics - OOP Master Page',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
