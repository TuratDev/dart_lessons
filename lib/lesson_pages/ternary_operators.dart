import 'package:flutter/material.dart';

class ThirthLessonPage extends StatefulWidget {
  const ThirthLessonPage({super.key});

  @override
  State<ThirthLessonPage> createState() => _ThirthLessonPageState();
}

class _ThirthLessonPageState extends State<ThirthLessonPage> {
  int age = 0;

  @override
  Widget build(BuildContext context) {
    String status = (age >= 18)
        ? "Сиз чоң эле адамсыз."
        : "Сиз азырынча чоң адамдын катарын толуктабайсыз.";

    return Scaffold(
      appBar: AppBar(title: const Text("Ternary Operators"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Жашыңызды киргизиңиз',
            ),
            onChanged: (value) {
              setState(() {
                age = int.tryParse(value) ?? 0;
              });
            },
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(status, style: const TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}
