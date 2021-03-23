class StreakFive {
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