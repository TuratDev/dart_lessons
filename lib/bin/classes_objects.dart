import 'package:flutter/foundation.dart';

class Student {
  String name; // маалымат
  int age; // маалымат
  int classNumber; // маалымат
  String major; // маалымат

  Student(this.name, this.age, this.classNumber, this.major);

  void introduce() {
    if (kDebugMode) {
      print("Салам, менин атым $name, мен $age жаштамын");
    }
  }
}

class Teacher {
  String name;
  String subject;
  int experience;

  Teacher(this.name, this.subject, this.experience);

  void introduce() {
    if (kDebugMode) {
      print(
        "Салам, менин атым $name, мен $subject мугалимимин $experience жыл тажрыйбам бар",
      );
    }
  }
}

class Car {
  String brand;
  String model;
  int year;
  String color;
  int speed;

  Car(this.brand, this.model, this.year, this.color, this.speed);

  void drive() {
    if (kDebugMode) {
      print("$brand унаа $speed км/саат ылдамдыкта кетип бара жатат");
    }
  }

  void speedUp() {
    speed += 90;
    if (kDebugMode) {
      print("$brand унаа $speed км/саат ылдамдыкта кетип бара жатат");
    }
  }
}

class BankAccount {
  String ownerName;
  double balance;

  BankAccount(this.ownerName, this.balance);

  void deposit(double amount) {
    balance += amount;
    if (kDebugMode) {
      print("$ownerName $amount сом салынды");
    }
  }

  void withdraw(double amount) {
    balance -= amount;
    if (kDebugMode) {
      print("$ownerName $amount сом алынды");
    }
  }
}

void main() {
  Student st1 = Student("Ali", 18, 1, "IT");
  Student st2 = Student("Канымжан", 17, 1, "Math");
  Teacher t1 = Teacher("Turat", "Kyrgyz Language", 11);

  if (kDebugMode) {
    print(st1.name); // Ali
    print(st2.name); // Канымжан
    st1.introduce();
    st2.introduce();
    t1.introduce();

    Car car1 = Car("Mercedes", "S-Class", 2022, "Black", 0);
    car1.drive();
    car1.speedUp();

    BankAccount b1 = BankAccount("Aizirek", 1000);
    b1.deposit(100);
    b1.withdraw(50);
  }
}
