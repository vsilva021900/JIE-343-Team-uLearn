class Rewards {
  static int total_coins = 0;

  static int gold_coins = 0;
  static int silver_coins = 0;
  static int gold_stack = 0;
  static int coin_bag = 0;
  static int armor_car = 0;
  static int bank = 0;

  // increment total_coins and gold_coins, then call _merge
  static addGoldCoin() {
    total_coins += 1;
    gold_coins += 1;

    _merge();
  }

  // increment silver_coins, then check if there are at least 2
  static addSilverCoin() {
    silver_coins += 1;

    if (silver_coins >= 2) {
      silver_coins -= 2;
      addGoldCoin();
    }
  }

  // only merge if the amount of the next item is less than 5
  static _merge() {
    if (gold_coins >= 5 && gold_stack < 5) {
      gold_coins -= 5;
      gold_stack += 1;
    }
    if (gold_stack >= 5 && coin_bag < 5) {
      gold_stack -= 5;
      coin_bag += 1;
    }
    if (coin_bag >= 5 && armor_car < 5) {
      coin_bag -= 5;
      armor_car += 1;
    }
    if (armor_car >= 5 && bank < 5) {
      armor_car -= 5;
      bank += 1;
    }
  }
}