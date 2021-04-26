import '../helper.dart';

class StreakFour {
  // [0] -> 4
  // [1] -> 4.1
  // [2] -> 4.2
  // [3] -> 4.3
  // [4] -> 4.4
  // [5] -> 4.5
  // [6] -> 4.6
  // [7] -> 4.7
  // [8] -> 4.8
  // [9] -> 4.9
  // [10] -> 4.10
  static List<int> streak = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  static List<int> maxStreak = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  static List<bool> checkmark = [false, false, false, false, false, false, false, false, false, false, false];

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