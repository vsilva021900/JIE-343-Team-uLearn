import 'package:flutter/material.dart';
import 'StreakMain.dart';
import 'one/ScoreMenuOne.dart';
import 'two/ScoreMenuTwo.dart';
import 'three/ScoreMenuThree.dart';
import 'four/ScoreMenuFour.dart';
import 'five/ScoreMenuFive.dart';
import 'six/ScoreMenuSix.dart';
import 'seven/ScoreMenuSeven.dart';
import 'eight/ScoreMenuEight.dart';
import 'nine/ScoreMenuNine.dart';
import 'ten/ScoreMenuTen.dart';
import 'helper.dart';


class MainScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

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
            backButton(context),
            homeButton(context),
            Spacer(flex: 5),
            pinkPigButton(context)
          ]
      )
  );
}

Widget sub(BuildContext context) {
  return Container(
      child: Column(
          children: [
            Text('Word Structures',
                style: textStyle(Colors.black, 30)
            ),
            Container(
                height: screenHeight * 0.03
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => ScoreOne(),
                            transitionDuration: Duration(seconds: 0)
                        )
                    );
                  },
                  child: Text('1   Base Words and Endings - ed, ing',
                      style: textStyle(Colors.black, screenWidth / 35)
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(1),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => ScoreTwo(),
                            transitionDuration: Duration(seconds: 0)
                        )
                    );
                  },
                  child: Text('2   Base Words and Endings - s, ies, es',
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(2),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => ScoreThree(),
                            transitionDuration: Duration(seconds: 0)
                        )
                      );
                    },
                    child: Text('3   Comparative Endings',
                        style: textStyle(Colors.black, screenWidth / 35)
                    ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(3),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => ScoreFour(),
                            transitionDuration: Duration(seconds: 0)
                        )
                    );
                  },
                  child: Text('4   Plurals',
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, _, __) => ScoreFive(),
                        transitionDuration: Duration(seconds: 0)
                      )
                    );
                  },
                  child: Text('5   Possessives',
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, _, __) => ScoreSix(),
                        transitionDuration: Duration(seconds: 0)
                      )
                    );
                  },
                  child: Text('6   Contractions',
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(6),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, _, __) => ScoreSeven(),
                        transitionDuration: Duration(seconds: 0)
                      )
                    );
                  },
                  child: Text('7   Compound Words',
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(7),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, _, __) => ScoreEight(),
                        transitionDuration: Duration(seconds: 0)
                      )
                    );
                  },
                  child: Text('8   Prefixes',
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, _, __) => ScoreNine(),
                        transitionDuration: Duration(seconds: 0)
                      )
                    );
                  },
                  child: Text('9   Suffixes',
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(9),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                       context,
                       PageRouteBuilder(
                         pageBuilder: (context, _, __) => ScoreTen(),
                         transitionDuration: Duration(seconds: 0)
                       )
                     );
                  },
                  child: Text('10   Syllables',
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                )
              ],
            ),
          ]
      )
  );
}

Row starsAndCheck(int index) {
  Container checkmark;
  if (StreakMain.checkmark[index]) {
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
  String imagePath = StreakMain.getImagePath(index);
  if (imagePath.length == 0) {
    return Container(
        width: screenWidth / 5,
        height: screenHeight / 12
    );
  }

  return Container(
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: Image.asset(StreakMain.getImagePath(index),
        fit: BoxFit.contain,
      )
  );
}