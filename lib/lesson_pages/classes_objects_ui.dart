import 'package:flutter/material.dart';

// --- КЛАССТАР (Сиздин коддун негизинде) ---

class BankAccount {
  String ownerName;
  double balance;

  BankAccount(this.ownerName, this.balance);

  String deposit(double amount) {
    balance += amount;
    return "$amount сом салынды. Жаңы баланс: $balance";
  }

  String withdraw(double amount) {
    if (amount > balance) {
      return "Ката: Каражат жетишсиз! Сизде болгону $balance сом бар.";
    }
    balance -= amount;
    return "$amount сом алынды. Калган баланс: $balance";
  }
}

class Car {
  String brand;
  int speed;

  Car(this.brand, this.speed);

  void speedUp() {
    speed += 20;
  }
}

// --- ФЛАТТЕР ИНТЕРФЕЙСИ ---

class OOPMasterPage extends StatefulWidget {
  const OOPMasterPage({super.key});

  @override
  State<OOPMasterPage> createState() => _OOPMasterPageState();
}

class _OOPMasterPageState extends State<OOPMasterPage> {
  // Объекттерди түзөбүз
  final BankAccount myAccount = BankAccount("Айзирек", 1000.0);
  final Car myCar = Car("Mercedes-Benz", 0);
  String bankLog = "Операция күтүлүүдө...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart OOP Lab"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSectionTitle("1. Банк Аккаунту (Encapsulation мисалы)"),
            _buildBankCard(),
            const SizedBox(height: 20),
            _buildSectionTitle("2. Унаа (Методдор жана Абал)"),
            _buildCarCard(),
            const SizedBox(height: 20),
            _buildSectionTitle("3. Студент & Мугалим"),
            _buildPeopleSection(),
          ],
        ),
      ),
    );
  }

  // БАНК КАРТОЧКАСЫ
  Widget _buildBankCard() {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              myAccount.ownerName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Text(
              "Баланс: ${myAccount.balance} сом",
              style: const TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              bankLog,
              style: TextStyle(
                color: bankLog.contains("Ката") ? Colors.red : Colors.grey,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      setState(() => bankLog = myAccount.deposit(500)),
                  child: const Text("+500 сом"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () =>
                      setState(() => bankLog = myAccount.withdraw(2000)),
                  child: const Text("-2000 сом"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // УНАА КАРТОЧКАСЫ
  Widget _buildCarCard() {
    return Card(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Icon(Icons.directions_car, size: 50, color: Colors.white),
            Text(
              myCar.brand,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "${myCar.speed} км/саат",
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Slider(
              value: myCar.speed.toDouble(),
              max: 220,
              onChanged: (val) {}, // Жөн гана визуалдык
            ),
            ElevatedButton.icon(
              onPressed: () => setState(() => myCar.speedUp()),

              label: const Text(
                "ГАЗ БАСУУ",
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              icon: const Icon(Icons.speed, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  // АДАМДАР БӨЛҮМҮ
  Widget _buildPeopleSection() {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            tileColor: Colors.blue.shade50,
            leading: const Icon(Icons.school),
            title: const Text("Али (IT)"),
            subtitle: const Text("Student"),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ListTile(
            tileColor: Colors.purple.shade50,
            leading: const Icon(Icons.person),
            title: const Text("Турат"),
            subtitle: const Text("Teacher"),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
