import 'package:flutter/material.dart';

class SecondLesson extends StatelessWidget {
  const SecondLesson({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "Turat"; // String - тексттик маалыматтарды сактоо үчүн
    int age = 39; // int - бүтүн сандарды сактоо үчүн
    var city = "Karakol"; // var - өзгөрмө тибин автоматтык түрдө аныктоо үчүн
    final country =
        "Kyrgyzstan"; // final - бир жолу дайындалган жана кийинчерээк өзгөртүлбөгөн
    double rating = 4.5; // double - ондук сандарды сактоо үчүн

    return Scaffold(
      appBar: AppBar(title: const Text("Second Page"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _builSectionTitle("1) String - Text"),
          _buildItem("String name = \"Turat\";"),
          _buildResult("Name: $name"),

          _builSectionTitle("2) int - Integer"),
          _buildItem("int age = 39;"),
          _buildResult("Age: $age"),

          _builSectionTitle("3) var - Type Inference"),
          _buildItem("var city = \"Karakol\";"),
          _buildResult("City: $city"),

          _builSectionTitle("4) final - Immutable Variable"),
          _buildItem("final country = \"Kyrgyzstan\";"),
          _buildResult("Country: $country"),

          _builSectionTitle("5) double - Ондук сандар"),
          _buildItem("double rating = 4.5;"),
          _buildResult("Rating: $rating"),
        ],
      ),
    );
  }
}

// UI жасоо үчүн жардамчы виджеттер

Widget _builSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 36, 63, 110),
      ),
    ),
  );
}

Widget _buildItem(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Text(text, style: TextStyle(fontSize: 16)),
  );
}

Widget _buildResult(String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    padding: const EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Colors.teal[200],
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}
