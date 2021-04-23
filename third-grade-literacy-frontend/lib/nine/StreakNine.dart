import '../helper.dart';

class StreakNine {
  // [0] -> 9.1
  // [1] -> 9.2
  // [2] -> 9.3
  // [3] -> 9.4
  // [4] -> 9.5
  // [5] -> 9.6
  // [6] -> 9.7
  static List<int> streak = [0, 0, 0, 0, 0, 0, 0];
  static List<int> maxStreak = [0, 0, 0, 0, 0, 0, 0];
  static List<bool> checkmark = [false, false, false, false, false, false, false];

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