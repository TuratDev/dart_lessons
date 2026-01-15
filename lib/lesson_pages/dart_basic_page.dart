import 'package:flutter/material.dart';

class DartBasic extends StatefulWidget {
  const DartBasic({super.key});

  @override
  State<DartBasic> createState() => _DartBasicState();
}

class _DartBasicState extends State<DartBasic> {
  String name =
      "Turat"; //String - бул тексттик маалыматтарды сактоо үчүн колдонулат
  int age = 39; //int - бул бүтүн сандарды сактоо үчүн колдонулат
  var city =
      "Karakol"; //var - бул өзгөрмө тибин автоматтык түрдө аныктоо үчүн колдонулат
  final country =
      "Kyrgyzstan"; //final - бул бир жолу дайындалган жана кийинчерээк өзгөртүлбөгөн өзгөрмөлөр үчүн колдонулат
  static const pi =
      3.14; //const - бул компиляция учурунда белгилүү болгон жана эч качан өзгөртүлбөгөн константтар үчүн колдонулат

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dart Basic"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Аты: $name"),
            Text("Жашы: $age"),
            Text("Шаары: $city"),
            Text("Мамлекети: $country"),
            Text("Pi: $pi"),
          ],
        ),
      ),
    );
  }
}
