import 'package:flutter/foundation.dart';

void main() {
  sayHello();
  greetUser('Аида');
  printUser(name: 'Aizrek', age: 16);
  showSum(25, 10);
  if (kDebugMode) {
    print('result: $result');
  }

  if (kDebugMode) {
    print('Is 13 even? ${isEven(13)}');
  }
  if (kDebugMode) {
    print('Is 4 even? ${isEven(4)}');
  }
}

bool isEven(int number) {
  return number % 2 == 0;
}

int result = calculateSum(35, 10);

int calculateSum(int a, int b) {
  return a + b;
}

void showSum(int a, int b) {
  if (kDebugMode) {
    print('Сумма: ${a + b}');
  }
}

void sayHello() {
  if (kDebugMode) {
    print('Салам, Dart Functions! sayHello иштеди.');
  }
}

void greetUser(String name) {
  if (kDebugMode) {
    print('Салам, $name! greetUser иштеди.');
  }
}

void printUser({
  required String name,
  required int age,
  String password = '1234',
}) {
  if (kDebugMode) {
    print(
      'Колдонуучу: $name, жашы: $age, пароль: $password'
      '! printUser иштеди.',
    );
  }
}
