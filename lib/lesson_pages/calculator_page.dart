import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double number1 = 0;
  double number2 = 0;

  @override
  Widget build(BuildContext context) {
    double sum = number1 * 87.7;
    double aluu = number1 - number2;
    double koboytuu = number1 * number2;
    double boluu = number2 != 0 ? number1 / number2 : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator Page"),
        backgroundColor: Colors.amber[200],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Биринчи санды киргизиңиз",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  number1 = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Экинчи санды киргизиңиз",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  number2 = double.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),

            _resultBox("Сумма", sum),
            _resultBox("Алуунун натыйжасы", aluu),
            _resultBox("Көбөйтүндү", koboytuu),
            _resultBox("Тийинди", boluu),
          ],
        ),
      ),
    );
  }
}

Widget _resultBox(String title, double result) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.amber[100],
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Text(
      "$title: $result",
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
    ),
  );
}
