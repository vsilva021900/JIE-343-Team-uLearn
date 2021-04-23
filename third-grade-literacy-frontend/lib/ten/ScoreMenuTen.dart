import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/MainScoreMenu.dart';
import 'package:hearatale_literacy_app/ten/StreakTen.dart';
import '../helper.dart';


class ScoreTen extends StatelessWidget {
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
                    Text('Syllables',
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
                    Text('10  One Syllable ',
                        style: textStyle(Colors.black, screenWidth / 32)
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
                    Text('10  Two Syllables ',
                        style: textStyle(Colors.black, screenWidth / 32)
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
                    Text('10  Three Syllables',
                        style: textStyle(Colors.black, screenWidth / 32)
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
                    Text('10  Four Syllables',
                        style: textStyle(Colors.black, screenWidth / 32)
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
  if (StreakTen.checkmark[index]) {
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
  String imagePath = StreakTen.getImagePath(index);
  if (imagePath.length == 0) {
    return Container(
        width: screenWidth / 5,
        height: screenHeight / 12
    );
  }

  return Container(
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: Image.asset(StreakTen.getImagePath(index),
        fit: BoxFit.contain,
      )
  );
}