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

    return _imagePaths[s][maxS - s];
  }

  // [# gold] [ # silver]
  static var _imagePaths = [
    // 0 gold
    ["", "assets/stars/one_silver.png", "assets/stars/two_silver.png", "assets/stars/three_silver.png",
      "assets/stars/four_silver.png"],
    // 1 gold
    ["assets/stars/one_gold.png", "assets/stars/one_gold_one_silver.png", "assets/stars/one_gold_two_silver.png",
      "assets/stars/one_gold_three_silver.png", "assets/stars/one_gold_four_silver.png"],
    // 2 gold
    ["assets/stars/two_gold.png", "assets/stars/two_gold_one_silver.png", "assets/stars/two_gold_two_silver.png",
      "assets/stars/two_gold_three_silver.png"],
    // 3 gold
    ["assets/stars/three_gold.png", "assets/stars/three_gold_one_silver.png", "assets/stars/three_gold_two_silver.png"],
    // 4 gold
    ["assets/stars/four_gold.png", "assets/stars/four_gold_one_silver.png"],
    // 5 gold
    ["assets/stars/five_gold.png"]
  ];
}