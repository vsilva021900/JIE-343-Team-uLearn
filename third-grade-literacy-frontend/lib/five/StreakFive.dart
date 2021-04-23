import '../helper.dart';

class StreakFive {
  // [0] -> 5
  // [1] -> 5.1
  // [2] -> 5.2
  // [3] -> 5.3
  static List<int> streak = [0, 0, 0, 0];
  static List<int> maxStreak = [0, 0, 0, 0];
  static List<bool> checkmark = [false, false, false, false];

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
        streak[index] -= 1;
      }
    }
  }

  static String getImagePath(int index) {
    int s = streak[index];
    int maxS = maxStreak[index];

    return streakImagePaths[s][maxS - s];
  }
}