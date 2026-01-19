import 'package:flutter/material.dart';

class LoopsMasterPage extends StatefulWidget {
  const LoopsMasterPage({super.key});

  @override
  State<LoopsMasterPage> createState() => _LoopsMasterPageState();
}

class _LoopsMasterPageState extends State<LoopsMasterPage> {
  // Маалыматтар тизмеси (List)
  List<String> jashylchalar = ['Алма', 'Банан', 'Апельсин', 'Манго', 'Өрүк'];
  List<String> logMessages = [];

  // 1. For Loop - Сандарды тизмеге кошуу
  void runForLoop() {
    setState(() {
      logMessages.clear();
      logMessages.add(
        "--- For Loop Башталды (1ден 5ке чейин, 3тү аттап өтөт) ---",
      );
      for (int i = 1; i <= 5; i++) {
        if (i == 3) {
          logMessages.add("Skip: 3 саны 'continue' аркылуу атталды");
          continue;
        }
        logMessages.add("Цикл иштеп жатат: $i");
      }
    });
  }

  // 2. While Loop - Шарт аткарылганча иштейт
  void runWhileLoop() {
    setState(() {
      logMessages.clear();
      logMessages.add("--- While Loop Башталды ---");
      int j = 1;
      while (j <= 10) {
        logMessages.add("While айлануусу: $j");
        j++;
      }
    });
  }

  // 3. Do-While Loop - Жок дегенде бир жолу иштеген цикл
  void runDoWhileLoop() {
    setState(() {
      logMessages.clear();
      logMessages.add("--- Do-While Loop Башталды ---");
      int san = 1;
      do {
        logMessages.add("Do-While иштеди: $san");
        san++;
      } while (san <= 2);
    });
  }

  // 4. For-in Loop - Тизме (List) менен иштөө
  void runForInLoop() {
    setState(() {
      logMessages.clear();
      logMessages.add("--- For-in Loop (Тизмедеги жемиштер) ---");
      for (var fruit in jashylchalar) {
        logMessages.add("Тизмеден алынды: $fruit");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart Loops Lab"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Башкаруу баскычтары
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              _buildButton("For Loop", Colors.orange, runForLoop),
              _buildButton("While Loop", Colors.blue, runWhileLoop),
              _buildButton("Do-While", Colors.green, runDoWhileLoop),
              _buildButton("For-in (List)", Colors.purple, runForInLoop),
            ],
          ),
          const Divider(height: 40, thickness: 2),
          // Натыйжаны көрсөтүүчү экран
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
              ),
              child: logMessages.isEmpty
                  ? const Center(
                      child: Text(
                        "Баскычты басып, циклды иштетиңиз!",
                        style: TextStyle(color: Colors.white70),
                      ),
                    )
                  : ListView.builder(
                      itemCount: logMessages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            logMessages[index],
                            style: const TextStyle(
                              color: Colors.greenAccent,
                              fontFamily: 'Courier',
                              fontSize: 16,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  // Баскыч жасоочу функция
  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
