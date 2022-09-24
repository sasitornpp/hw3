import 'dart:math';

class Game {
  int answer = 0; // instance field
  int count = 0; // นับรอบที่ทาย

  Game({int maxRandom = 100}) {
    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
    print('│◆ คำตอบคือ $answer');
  }

  int doGuess(int num) {
    if (num > answer) {
      count += 1;
      print('│➧ $num is too high ▲');
      return 0;
    } else if (num < answer) {
      count += 1;
      print('│➧ $num is too low ▼');
      return -1;
    } else {
      count += 1;
      print('│➧ $num is correct ✔, total guesses: $count');
      return 1;
    }
  }
}