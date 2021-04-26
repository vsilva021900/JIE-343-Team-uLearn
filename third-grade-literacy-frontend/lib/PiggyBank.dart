import 'dart:math';
import 'package:flutter/material.dart';
import 'WordStructures.dart';
import 'MainScoreMenu.dart';
import 'Rewards.dart';
import 'helper.dart';


bool test = false;
void main() {
  if (test) {
    Rewards.addSilverCoin();
    for (int i = 0; i < (10 + 1*5 + 5*5 + 25*5 + 125*5 + 625*5); i++) {
      Rewards.addGoldCoin();
    }

    print("total: " + Rewards.total_coins.toString());
    print("gold coin: " + Rewards.gold_coins.toString());
    print("silver coin: " + Rewards.silver_coins.toString());
    print("stack: " + Rewards.gold_stack.toString());
    print("bag: " + Rewards.coin_bag.toString());
    print("car: " + Rewards.armor_car.toString());
    print("bank: " + Rewards.bank.toString());
  }

  runApp(MaterialApp(
    home: PiggyBank()
  ));
}

class PiggyBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    return MaterialApp(
      home: Material(
        child: Row(
          children: [
            sideBar(context),
            Expanded(
              child: section(context)
            )
          ],
        )
      )
    );
  }
}

Widget sideBar(BuildContext context) {
  Color col = const Color(0xff6ec7d4);
  return Container(
    color: col,
      child: Column(
        children: <Widget>[
          Material(
            color: col,
            child: IconButton(
              icon: Image.asset('assets/placeholder_back_button.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ),
          Material(
            color: col,
            child: IconButton(
              icon: Image.asset('assets/placeholder_home_button.png'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                    PageRouteBuilder(
                      pageBuilder: (context, _, __) => MyApp(),
                      transitionDuration: Duration(seconds: 0)
                    ), (route) => false
                  );
                },
            )
          ),
          Spacer(flex: 5),
          Material(
            color: col,
            child: IconButton(
              icon: Image.asset('assets/star_button.png'),
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, _, __) => MainScore(),
                    transitionDuration: Duration(seconds: 0)
                  )
                );
              },
            )
          ),
        ]
      )
  );
}

Widget section(BuildContext context) {
  double titleFontSize = min(screenWidth / 25, screenHeight * 0.07);
  return Container(
    color: const Color(0xffddf6f8),
    child: Column(
      children: [
        Text('Total Coins: ' + Rewards.total_coins.toString(),
          style: textStyle(Colors.black, titleFontSize)
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              gold_coins(),
              silver_coins(),
              gold_stacks(),
              gold_bags(),
              armor_cars(),
              banks()
            ],
          )
        )
      ]
    )
  );
}


Widget gold_coins() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: row_gold_coins()
  );
}
// display at most 5 coins in a row
// when gold_coins > 5, display in the form:
// *coin* *coin* *coin* *coin* *coin* + *coin* x# (num of coins not displayed)
List<Widget> row_gold_coins() {
  List<Widget> list = [];
  double textFontSize = min(screenWidth / 30, screenHeight * 0.08);
  for (int i = 0; i < Rewards.gold_coins; i++) {
    if (i == 5) {
      list.add(
        Text(' + ',
          style: textStyle(Colors.black, textFontSize)
        )
      );
    }
    list.add(
      pad(Container(
        constraints: BoxConstraints(
          maxWidth: screenWidth * 0.09,
          maxHeight: screenHeight * 0.07
        ),
        child: Image.asset("assets/rewards/coin_gold.png"),
      ), 6, 6, 0, 0)
    );
    if (i == 5) {
      list.add(
        Text('x' + (Rewards.gold_coins - i).toString(),
          style: textStyle(Colors.black, textFontSize)
        )
      );
      break;
    }
  }
  return list;
}

Widget silver_coins() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: row_silver_coins()
  );
}
List<Widget> row_silver_coins() {
  List<Widget> list = [];
  for (int i = 0; i < Rewards.silver_coins; i++) {
    list.add(
      pad(Container(
        constraints: BoxConstraints(
          maxWidth: screenWidth * 0.09,
          maxHeight: screenHeight * 0.07
        ),
        child: Image.asset("assets/rewards/silver_coin.png"),
      ), 4, 4, 0, 0)
    );
  }
  return list;
}

Widget gold_stacks() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: row_gold_stacks()
  );
}
List<Widget> row_gold_stacks() {
  List<Widget> list = [];
  for (int i = 0; i < Rewards.gold_stack; i++) {
    list.add(
      pad(Container(
        constraints: BoxConstraints(
          maxWidth: screenWidth * 0.09,
          maxHeight: screenHeight * 0.13
        ),
        child: Image.asset("assets/rewards/stack_of_coins.png")
      ), 6, 6, 0, 0)
    );
  }
  return list;
}

Widget gold_bags() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: row_gold_bags()
  );
}
List<Widget> row_gold_bags() {
  List<Widget> list = [];
  for (int i = 0; i < Rewards.coin_bag; i++) {
    list.add(
      pad(Container(
        constraints: BoxConstraints(
          maxWidth: screenWidth * 0.16,
          maxHeight: screenHeight * 0.20
        ),
        child: Image.asset("assets/rewards/money_bag.png"),
      ), 4, 4, 0, 0)
    );
  }
  return list;
}

Widget armor_cars() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: row_armor_cars()
  );
}
List<Widget> row_armor_cars() {
  List<Widget> list = [];
  for (int i = 0; i < Rewards.armor_car; i++) {
    list.add(
      pad(Container(
        constraints: BoxConstraints(
          maxWidth: screenWidth * 0.18,
          maxHeight: screenHeight * 0.17
        ),
        child: Image.asset("assets/rewards/armored_car.png"),
      ), 1, 1, 0, 0)
    );
  }
  return list;
}

Widget banks() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: row_banks()
  );
}
List<Widget> row_banks() {
  List<Widget> list = [];
  for (int i = 0; i < Rewards.bank; i++) {
    list.add(
      pad(Container(
        constraints: BoxConstraints(
          maxWidth: screenWidth * 0.16,
          maxHeight: screenHeight * 0.20
        ),
        child: Image.asset("assets/rewards/bank.png"),
      ), 3, 3, 0, 0)
    );
  }
  return list;
}

Padding pad(Widget c, double l, double r, double t, double b) {
  return Padding(
    padding: EdgeInsets.only(left: l, right: r, top: t, bottom: b),
    child: c
  );
}