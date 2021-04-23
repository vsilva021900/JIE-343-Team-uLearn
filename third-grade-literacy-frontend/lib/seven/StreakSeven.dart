import '../helper.dart';

class StreakSeven {

  static int streak = 0;
  static int maxStreak = 0;
  static bool checkmark = false;

  static correct() {
    if (!checkmark) {
      if (maxStreak == streak) {
        maxStreak += 1;
      }
      streak += 1;

      if (streak == 5 && maxStreak == 5) {
        checkmark = true;
      }
    }
  }

  static incorrect() {
    if (!checkmark) {
      if (streak > 0) {
        streak -= 1;
      }
    }
  }

  static String getImagePath() {
    int s = streak;
    int maxS = maxStreak;

    return streakImagePaths[s][maxS - s];
  }
}