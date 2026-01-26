import 'package:flutter/material.dart';

class DataStructuresPage extends StatefulWidget {
  const DataStructuresPage({super.key});

  @override
  State<DataStructuresPage> createState() => _DataStructuresPageState();
}

class _DataStructuresPageState extends State<DataStructuresPage> {
  // 1. Контроллер - Текст филддеги жазууну кармап алуу үчүн
  final TextEditingController _nameController = TextEditingController();

  // 2. Маалыматтар
  List<String> names = ['Айзирек', 'Бекзат', 'Айжамал', 'Дастан', 'Канымжан'];

  Map<String, int> ages = {
    'Айзирек': 15,
    'Бекзат': 30,
    'Айжамал': 22,
    'Дастан': 28,
    'Канымжан': 17,
  };

  Set<int> numbers = {2, 1, 5, 7, 3, 4};

  void sortNumbers() {
    setState(() {
      // Set'ти List'ке айландырып, sort() методу менен иреттейбиз
      // андан кийин кайра Set'ке айландырып койсок болот
      List<int> sortedList = numbers.toList()..sort();
      numbers = sortedList.toSet();
    });
  }

  // Окуучу кошуу функциясы
  void _addNewName() {
    if (_nameController.text.trim().isNotEmpty) {
      setState(() {
        names.add(_nameController.text.trim());
        _nameController.clear(); // Кошкондон кийин ичин тазалоо
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose(); // Эстутумду үнөмдөө үчүн контроллерди өчүрүү
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart Data Structures Lab"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _buildListSection(),
            const SizedBox(height: 15),
            _buildMapSection(),
            const SizedBox(height: 15),
            _buildSetSection(),
          ],
        ),
      ),
    );
  }

  // --- LIST БӨЛҮМҮ ---
  Widget _buildListSection() {
    return _buildCard(
      title: "List (Тизме) - Жаңы окуучу кош",
      color: Colors.blue.shade50,
      icon: Icons.person_add,
      child: Column(
        children: [
          // ТЕКСТ КИРГИЗҮҮ ТАЛААСЫ
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: "Окуучунун атын жазыңыз...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.blue,
                  size: 30,
                ),
                onPressed: _addNewName, // Баскычты басканда кошот
              ),
            ),
            onSubmitted: (value) => _addNewName(), // Enter басканда кошот
          ),
          const SizedBox(height: 15),

          // ТИЗМЕ (CHIPS)
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: names
                .map(
                  (name) => Chip(
                    backgroundColor: Colors.blue.shade100,
                    label: Text(name),
                    onDeleted: () => setState(() => names.remove(name)),
                  ),
                )
                .toList(),
          ),
          const Divider(),
          TextButton.icon(
            onPressed: () => setState(() {
              names = names.map((e) => e.toLowerCase()).toList();
            }),
            icon: const Icon(Icons.text_fields),
            label: const Text("БААРЫН КИЧИНЕ ТАМГАГА АЙЛАНТ"),
          ),

          const Divider(),
          TextButton.icon(
            onPressed: () => setState(() {
              names = names.map((e) => e.toUpperCase()).toList();
            }),
            icon: const Icon(Icons.text_fields),
            label: const Text("БААРЫН ЧОҢ ТАМГА КЫЛ"),
          ),
        ],
      ),
    );
  }

  // --- MAP БӨЛҮМҮ ---
  Widget _buildMapSection() {
    return _buildCard(
      title: "Map (Сөздүк) - Жаш курагы",
      color: Colors.green.shade50,
      icon: Icons.badge,
      child: Column(
        children: [
          // ages.entries.map аркылуу Map'тин ичиндеги маалыматтарды тизмеге айлантабыз
          ...ages.entries.map(
            (entry) => ListTile(
              dense: true,
              leading: const Icon(Icons.person, size: 20, color: Colors.green),
              title: Text(entry.key), // Ачкыч (Аты)
              // Trailing бөлүгүнө жашын жана өчүрүү баскычын катар жайгаштырабыз
              trailing: Row(
                mainAxisSize:
                    MainAxisSize.min, // Row өтө чоң болуп кетпеши үчүн
                children: [
                  Text(
                    "${entry.value} жаш",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8), // Аралык
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                      size: 20,
                    ),
                    onPressed: () {
                      // Өчүрүү баскычы басылганда гана өчүрүлөт
                      setState(() {
                        ages.remove(entry.key);
                      });
                    },
                    tooltip: "Өчүрүү",
                  ),
                ],
              ),
              // Эми ListTile өзүн басканда өчпөйт, кааласаңыз башка функция кошсо болот
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  // --- SET БӨЛҮМҮ ---
  Widget _buildSetSection() {
    return _buildCard(
      title: "Set (Жыйынды) - Кайталанбас сандар",
      color: Colors.orange.shade50,
      icon: Icons.layers,
      child: Column(
        children: [
          // Сандарды экранга чыгаруу
          Text(
            "Сандар: ${numbers.toString()}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Сан кошуу баскычы
              ElevatedButton(
                onPressed: () => setState(() => numbers.add(10)), // 10ду кошот
                child: const Text("10ду кош"),
              ),
              const SizedBox(width: 10),

              // ИРЕТТӨӨ БАСКЫЧЫ
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: sortNumbers, // Жогорудагы функцияны чакырат
                child: const Row(
                  children: [
                    Icon(Icons.sort, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      "Ирети менен тиз",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Set ичиндеги сандарды иреттөө үчүн алгач тизмеге (List) айландырылат.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  // КӨМӨКЧҮ КАРТОЧКА
  Widget _buildCard({
    required String title,
    required Widget child,
    required Color color,
    required IconData icon,
  }) {
    return Card(
      color: color,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.deepPurple),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            child,
          ],
        ),
      ),
    );
  }
}
