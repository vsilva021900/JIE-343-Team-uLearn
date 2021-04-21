import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/MainScoreMenu.dart';
import 'package:hearatale_literacy_app/three/StreakThree.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';

class ScoreThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                sideBar(context),
                Expanded(
                    child: sub(context)
                )
              ],
            )
        )
    );
  }
}

Widget sideBar(BuildContext context) {
  return Container(
      color: const Color(0xffc4e8e6),
      child: Column(
          children: <Widget>[
            Material(
                color: const Color(0xffc4e8e6),
                child: IconButton(
                  icon: Image.asset('assets/placeholder_back_button.png'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
            ),
            Material(
                color: const Color(0xffc4e8e6),
                child: IconButton(
                  icon: Image.asset('assets/placeholder_home_button.png'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => MyApp(),
                            transitionDuration: Duration(seconds: 0)
                        ), (route) => false);
                  },
                )
            ),
            Spacer(flex: 5),
            Material(
                color: const Color(0xffc4e8e6),
                child: IconButton(
                    icon: Image.asset('assets/placeholder_piggy_button.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => PiggyBank(),
                              transitionDuration: Duration(seconds: 0)
                          )
                      );
                    }
                )
            ),
          ]
      )
  );
}

Widget sub(BuildContext context) {
  return Container(
      child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, _, __) => MainScore(),
                          transitionDuration: Duration(seconds: 0)
                      )
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Comparative Endings',
                        style: textStyle(Colors.black, 30)
                    ),
                  ],
                )
            ),
            Container(
                height: screenHeight / 30
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(1),
                Row(
                  children: [
                    Text('3.1  usually add ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('er ',
                        style: textStyle(Colors.red, screenWidth / 32)
                    ),
                    Text('for ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('more, ',
                        style: textStyle(Colors.green, screenWidth / 32)
                    ),
                    Text('est ',
                        style: textStyle(Colors.red, screenWidth / 32)
                    ),
                    Text('for ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('most',
                        style: textStyle(Colors.green, screenWidth / 32)
                    ),
                  ],
                ),
              ],
            ),
            Container(
                height: screenHeight / 30
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(2),
                Row(
                  children: [
                    Text('3.2  drop final ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('e ',
                        style: textStyle(Colors.green, screenWidth / 32)
                    ),
                    Text('and add ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('er ',
                        style: textStyle(Colors.red, screenWidth / 32)
                    ),
                    Text('or ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('est',
                        style: textStyle(Colors.red, screenWidth / 32)
                    ),
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 30
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(3),
                Row(
                  children: [
                    Text('3.3  change final ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('y ',
                        style: textStyle(Colors.green, screenWidth / 32)
                    ),
                    Text('to ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('i ',
                        style: textStyle(Colors.red, screenWidth / 32)
                    ),
                    Text('and add ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('er ',
                        style: textStyle(Colors.red, screenWidth / 32)
                    ),
                    Text('or ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('est ',
                        style: textStyle(Colors.red, screenWidth / 32)
                    ),
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 30
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(4),
                Row(
                  children: [
                    Text('3.4  double final consonant add ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('er ',
                        style: textStyle(Colors.red, screenWidth / 32)
                    ),
                    Text('or ',
                        style: textStyle(Colors.black, screenWidth / 32)
                    ),
                    Text('est',
                        style: textStyle(Colors.red, screenWidth / 32)
                    ),
                  ],
                )
              ],
            ),
          ]
      )
  );
}

Row starsAndCheck(int index) {
  Container checkmark;
  if (StreakThree.checkmark[index]) {
    checkmark = Container(
        constraints: BoxConstraints(maxWidth: screenHeight / 12, maxHeight: screenHeight / 12),
        child: Image.asset("assets/stars/placeholder_checkmark.png",
          fit: BoxFit.contain,
        )
    );
  }
  else {
    checkmark = Container(
      // color: Colors.green,
        width: screenHeight / 12,
        height: screenHeight / 12
    );
  }

  return Row(
    children: [
      Container(
        // color: Colors.black,
          width: screenWidth / 40,
          height: screenHeight / 12
      ),
      starImage(index),
      Container(
        // color: Colors.black,
          width: screenWidth * 0.01,
          height: screenHeight / 12
      ),
      checkmark,
      Container(
        // color: Colors.black,
          width: screenWidth / 40,
          height: screenHeight / 12
      )
    ],
  );
}

Container starImage(int index) {
  String imagePath = StreakThree.getImagePath(index);
  if (imagePath.length == 0) {
    return Container(
        width: screenWidth / 5,
        height: screenHeight / 12
    );
  }

  return Container(
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: Image.asset(StreakThree.getImagePath(index),
        fit: BoxFit.contain,
      )
  );
}

double screenHeight, screenWidth;
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}