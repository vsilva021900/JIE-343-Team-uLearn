import 'package:flutter/material.dart';

import '../WordStructures.dart';
import '../MainScoreMenu.dart';
import 'StreakSix.dart';


class ScoreSix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Material(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  sideBar(context),
                  Expanded(
                      child: sub(context)
                  )
                ]
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
                    onPressed: () {}
                )
            ),
          ]
      )
  );
}

Widget sub(BuildContext context) {
  double textFontSize = screenWidth / 31.5;
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
                child: Text('Contractions',
                    style: textStyle(Colors.black, screenWidth / 25)
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(0),
                Row(
                  children: [
                    Text('6.1  pronouns with ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('am ',
                        style: textStyle(Colors.green, textFontSize)
                    ),
                    Text('add ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('\'m',
                        style: textStyle(Colors.red, textFontSize)
                    ),
                    Text(',',
                        style: textStyle(Colors.black, textFontSize)
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                    width: (2 * screenWidth / 40) + (screenWidth * 0.01)
                ),
                Container(
                    width: (screenWidth / 5) + (screenHeight / 12)
                ),
                Text('          with ',
                    style: textStyle(Colors.black, textFontSize)
                ),
                Text('are ',
                    style: textStyle(Colors.green, textFontSize)
                ),
                Text('\'re',
                    style: textStyle(Colors.red, screenWidth / 30)
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(1),
                Row(
                  children: [
                    Text('6.2  pronouns with ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('is ',
                        style: textStyle(Colors.green, textFontSize)
                    ),
                    Text('add ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('\'s',
                        style: textStyle(Colors.red, textFontSize)
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(2),
                Row(
                  children: [
                    Text('6.3  pronouns with ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('will ',
                        style: textStyle(Colors.green, textFontSize)
                    ),
                    Text('add ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('\'ll',
                        style: textStyle(Colors.red, textFontSize)
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(3),
                Row(
                  children: [
                    Text('6.4  pronouns with ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('would ',
                        style: textStyle(Colors.green, textFontSize)
                    ),
                    Text('add ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('\'d',
                        style: textStyle(Colors.red, textFontSize)
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(4),
                Row(
                  children: [
                    Text('6.5  with ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('have ',
                        style: textStyle(Colors.green, textFontSize)
                    ),
                    Text('add ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('\'ve',
                        style: textStyle(Colors.red, textFontSize)
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(5),
                Row(
                  children: [
                    Text('6.6  verbs with ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('not ',
                        style: textStyle(Colors.green, textFontSize)
                    ),
                    Text('add ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('n\'t',
                        style: textStyle(Colors.red, textFontSize)
                    ),
                    Text(',',
                        style: textStyle(Colors.black, screenWidth / 30)
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                    width: (2 * screenWidth / 40) + (screenWidth * 0.01)
                ),
                Container(
                    width: (screenWidth / 5) + (screenHeight / 12)
                ),
                Text('          will ',
                    style: textStyle(Colors.blue, textFontSize)
                ),
                Text('to ',
                    style: textStyle(Colors.black, textFontSize)
                ),
                Text('won\'t',
                    style: textStyle(Colors.red, textFontSize)
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(6),
                Row(
                  children: [
                    Text('6.7  noun contractions with ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('is ',
                        style: textStyle(Colors.green, textFontSize)
                    ),
                    Text('add ',
                        style: textStyle(Colors.black, textFontSize)
                    ),
                    Text('\'s',
                        style: textStyle(Colors.red, textFontSize)
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(7),
                Text('6.8  noun contractions and',
                    style: textStyle(Colors.black, textFontSize)
                )
              ],
            ),
            Row(
              children: [
                Container(
                    width: (2 * screenWidth / 40) + (screenWidth * 0.01)
                ),
                Container(
                    width: (screenWidth / 5) + (screenHeight / 12)
                ),
                Text('          noun possessives',
                    style: textStyle(Colors.black, textFontSize)
                )
              ],
            )
          ]
      )
  );
}

Row starsAndCheck(int index) {
  Container checkmark;
  if (StreakSix.checkmark[index]) {
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
          width: screenWidth / 40,
          height: screenHeight / 12
      ),
      starImage(index),
      Container(
          width: screenWidth * 0.01,
          height: screenHeight / 12
      ),
      checkmark,
      Container(
          width: screenWidth / 40,
          height: screenHeight / 12
      )
    ],
  );
}

Container starImage(int index) {
  String imagePath = StreakSix.getImagePath(index);
  if (imagePath.length == 0) {
    return Container(
        width: screenWidth / 5,
        height: screenHeight / 12
    );
  }

  return Container(
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: Image.asset(StreakSix.getImagePath(index),
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