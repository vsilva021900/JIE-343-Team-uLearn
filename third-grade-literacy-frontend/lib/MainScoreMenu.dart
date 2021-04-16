import 'package:flutter/material.dart';
import 'WordStructures.dart';
import 'StreakMain.dart';
import 'package:hearatale_literacy_app/one/ScoreMenuOne.dart';
import 'package:hearatale_literacy_app/two/ScoreMenuTwo.dart';
import 'package:hearatale_literacy_app/three/ScoreMenuThree.dart';
import 'package:hearatale_literacy_app/four/ScoreMenuFour.dart';
import 'package:hearatale_literacy_app/five/ScoreMenuFive.dart';
import 'package:hearatale_literacy_app/nine/ScoreMenuNine.dart';
import 'package:hearatale_literacy_app/ten/ScoreMenuTen.dart';
import 'PiggyBank.dart';


class MainScore extends StatelessWidget {
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
                      Navigator.pushAndRemoveUntil(context,
                        PageRouteBuilder(
                          pageBuilder: (context, _, __) => PiggyBank(),
                          transitionDuration: Duration(seconds: 0)
                        ), (route) => false);
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
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, _, __) => Test(),
                    //     transitionDuration: Duration(seconds: 0)
                    //   )
                    // );
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
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, _, __) => Test(),
                    //     transitionDuration: Duration(seconds: 0)
                    //   )
                    // );
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
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, _, __) => Test(),
                    //     transitionDuration: Duration(seconds: 0)
                    //   )
                    // );
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

double screenHeight, screenWidth;
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}