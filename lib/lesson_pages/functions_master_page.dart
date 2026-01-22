import 'package:flutter/material.dart';

class FunctionsMasterPage extends StatefulWidget {
  const FunctionsMasterPage({super.key});

  @override
  State<FunctionsMasterPage> createState() => _FunctionsMasterPageState();
}

class _FunctionsMasterPageState extends State<FunctionsMasterPage> {
  // Экранга маалымат чыгаруу үчүн өзгөрмөлөр
  String helloMessage = "Саламдашуу күтүлүүдө...";
  String sumResult = "0";
  String evenCheckResult = "Санды текшериңиз";
  String userData = "Колдонуучу каттала элек";

  // 1. Жөнөкөй функция (Параметри жок, маани кайтарбайт)
  void sayHello() {
    setState(() {
      helloMessage = "Салам, Dart Functions! sayHello иштеди.";
    });
  }

  // 2. Позициялык параметри бар функция (String name)
  void greetUser(String name) {
    setState(() {
      helloMessage = "Салам, $name! greetUser иштеди.";
    });
  }

  // 3. Маани кайтаруучу функция (int кайтарат)
  int calculateSum(int a, int b) {
    return a + b;
  }

  // 4. Маани кайтарбаган, бирок эсептөөчү функция (void)
  void showSum(int a, int b) {
    int result = calculateSum(a, b); // Башка функцияны чакыруу
    setState(() {
      sumResult = result.toString();
    });
  }

  // 5. Логикалык маани кайтаруучу функция (bool)
  bool isEven(int number) {
    return number % 2 == 0;
  }

  // 6. Аталган параметрлери бар функция (Named parameters)
  void printUser({
    required String name,
    required int age,
    String password = '1234',
  }) {
    setState(() {
      userData = "Аты: $name, Жашы: $age, Пароль: $password";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart Functions Lab"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // БӨЛҮМ 1: Жөнөкөй функциялар
            _buildSectionTitle("1. Жөнөкөй саламдашуу"),
            Card(
              color: Colors.teal.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      helloMessage,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: sayHello,
                          child: const Text("sayHello()"),
                        ),
                        ElevatedButton(
                          onPressed: () => greetUser("Аида"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                          ),
                          child: const Text("greetUser('Аида')"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // БӨЛҮМ 2: Математикалык функциялар
            _buildSectionTitle("2. Математика жана Логика"),

            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Сумма: $sumResult",
                      style: const TextStyle(fontSize: 20),
                    ),
                    ElevatedButton(
                      onPressed: () => showSum(25, 10),
                      child: const Text("showSum(25, 10)"),
                    ),
                    const Divider(),
                    Text("Жуппу?: $evenCheckResult"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () => setState(
                            () => evenCheckResult = "13 жуппу? ${isEven(13)}",
                          ),
                          child: const Text("Check 13"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => setState(
                            () => evenCheckResult = "4 жуппу? ${isEven(4)}",
                          ),
                          child: const Text("Check 4"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // БӨЛҮМ 3: Named Parameters
            _buildSectionTitle("3. Named Parameters (Колдонуучу)"),
            Card(
              color: Colors.orange.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      userData,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () => printUser(name: "Aizrek", age: 16),
                      child: const Text("Register Aizrek"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }
}
