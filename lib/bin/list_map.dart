import 'package:flutter/foundation.dart';

void main() {
  List<String> names = ['Айзирек', 'Бекзат', 'Айжамал', 'Дастан', 'Канымжан'];

  Map<String, int> ages = {
    'Айзирек': 15,
    'Бекзат': 30,
    'Айжамал': 22,
    'Дастан': 28,
    'Канымжан': 17,
  };

  Set<int> numbers = {2, 1, 5, 7, 3, 4};

  List<String> fruits = ['Алма', 'Ананас', 'Киви', 'Манго', 'Апельсин'];
  for (int i = 0; i < fruits.length; i++) {
    if (kDebugMode) {
      print(fruits[i]);
    }

    for (String fruit in fruits) {
      if (kDebugMode) {
        print(fruit);
      }
    }
  }

  // Элементи алып салуу
  numbers.remove(3);

  // Жаңы элементтерди кошуу
  ages['Айтурган'] = 22;

  // Элементтерди өчүрүү
  ages.remove('Дастан');

  // Listтин ар бир элементин чоң тамгага айлантуу
  // names = names.map((name) => name.toUpperCase()).toList();

  // Listке жаңы элемент кошуу
  names.add('Аида');
  names.add('Айтурган');

  // Listтен белгилүү бир элементти алып салуу
  names.remove('Бекзат');
  names.remove('Дастан');

  // names.remove('Айжан'); // Бул элемент жок болгондуктан эч нерсе болбойт

  // map функциясы ар бир элементке иштейт жана жаңы тизмени кайтарат

  if (kDebugMode) {
    print(names);
    print(names[4]); // 'Канымжан'
    print(ages);
    print(ages['Айжамал']); // 22
    print(numbers);
  }
}
