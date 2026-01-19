import 'package:flutter/material.dart';

class CycleGamePage extends StatefulWidget {
  const CycleGamePage({super.key});

  @override
  State<CycleGamePage> createState() => _CycleGamePageState();
}

class _CycleGamePageState extends State<CycleGamePage> {
  List<String> gameLogs = [];
  List<String> rewards = [];

  int score = 0;
  int level = 1;

  void resetGame() {
    setState(() {
      gameLogs.clear();
      rewards.clear();
      score = 0;
      level = 1;
      gameLogs.add('🟢 Оюн даяр. Баштоону басыңыз.');
    });
  }

  /// 1️⃣ for loop – Level’дер
  void runLevels() {
    setState(() {
      gameLogs.add('--- 🎯 Level фазасы (for loop) ---');
      for (int i = 1; i <= 5; i++) {
        if (i == 3) {
          gameLogs.add('⏭️ Level 3 өткөрүлүп кетти (continue)');
          continue;
        }
        level = i;
        gameLogs.add('▶️ Level $i ойнотулду');
      }
    });
  }

  /// 2️⃣ while loop – упай топтоо
  void collectScore() {
    setState(() {
      gameLogs.add('--- ⭐ Score фазасы (while loop) ---');
      while (score < 5) {
        score++;
        gameLogs.add('➕ Упай кошулду: $score');
      }
    });
  }

  /// 3️⃣ do-while – оюн сөзсүз иштейт
  void startRound() {
    setState(() {
      gameLogs.add('--- ❤️ Round башталды (do-while) ---');
      int round = 1;
      do {
        gameLogs.add('🔁 Round иштеди: $round');
        round++;
      } while (round <= 1);
    });
  }

  /// 4️⃣ for-in – сыйлыктар
  void giveRewards() {
    setState(() {
      gameLogs.add('--- 🎁 Сыйлыктар (for-in loop) ---');
      List<String> availableRewards = [
        '🍎 Алма',
        '🍌 Банан',
        '💎 Алмаз',
        '🏆 Кубок',
      ];

      for (var item in availableRewards) {
        rewards.add(item);
        gameLogs.add('🎉 Алынды: $item');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    resetGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎮 Cycle Game Lab'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),

          /// Баскычтар панели
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              _btn('Баштоо', Colors.green, startRound),
              _btn('Level’дер', Colors.orange, runLevels),
              _btn('Score', Colors.blue, collectScore),
              _btn('Сыйлыктар', Colors.purple, giveRewards),
              _btn('Reset', Colors.red, resetGame),
            ],
          ),

          const Divider(height: 30, thickness: 2),

          /// Консоль
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView.builder(
                itemCount: gameLogs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      gameLogs[index],
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontFamily: 'Courier',
                        fontSize: 15,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          /// Төмөнкү статус
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'Level: $level | Score: $score | Rewards: ${rewards.length}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btn(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
