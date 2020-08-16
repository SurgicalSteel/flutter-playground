import 'dart:math';

int getRandomNumberFromListSize(int listSize) {
  Random randomEpoch = new Random(DateTime.now().millisecondsSinceEpoch);
  int min = 0;
  int max = listSize;
  int result = min + randomEpoch.nextInt(max - min);
  return result;
}
