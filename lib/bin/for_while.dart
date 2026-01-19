import 'package:flutter/foundation.dart';

void main() {
  // for цикл боюнча мисал
  for (int i = 1; i <= 10; i++) {
    if (i == 3) {
      continue;
    }
    if (kDebugMode) {
      print('For цикл айлануусу: $i');
    }
  }

  // while цикл боюнча мисал
  int j = 1;
  while (j <= 10) {
    if (kDebugMode) {
      print('While цикл айлануусу: $j');
    }
    j++;
  }

  int san = 6;
  // do-while цикл боюнча мисал
  do {
    if (kDebugMode) {
      print('Do-While цикл айлануусу: $san');
    }
    san++;
  } while (san <= 10);

  List<String> jashylchalar = ['Алма', 'Банан', 'Апельсин', 'Манго', 'Өрүк'];
  // for-in цикл боюнча мисал
  for (String fruit in jashylchalar) {
    if (kDebugMode) {
      print('Жемиш: $fruit');
    }
  }
}
