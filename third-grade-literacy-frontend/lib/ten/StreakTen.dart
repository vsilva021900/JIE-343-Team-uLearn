import '../helper.dart';

class StreakTen {
  // [0] -> 10 All Syllables
  // [1] -> 10 1 Syllable
  // [2] -> 10 2 Syllables
  // [3] -> 10 3 Syllables
  // [4] -> 10 4 Syllables

  static List<int> streak = [0, 0, 0, 0, 0];
  static List<int> maxStreak = [0, 0, 0, 0, 0];
  static List<bool> checkmark = [false, false, false, false, false];

  static correct(int index) {
    if (!checkmark[index]) {
      if (maxStreak[index] == streak[index]) {
        maxStreak[index] += 1;
      }
      streak[index] += 1;

      if (streak[index] == 5 && maxStreak[index] == 5) {
        checkmark[index] = true;
      }
    }
  }

  static incorrect(int index) {
    if (!checkmark[index]) {
      if (streak[index] > 0) {
        streak[index] = 0;
      }
    }
  }

  static String getImagePath(int index) {
    int s = streak[index];
    int maxS = maxStreak[index];

    return streakImagePaths[s][maxS - s];
  }
}