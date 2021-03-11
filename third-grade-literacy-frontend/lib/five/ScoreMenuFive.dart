import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/five/StreakFive.dart';

class ScoreFive extends StatelessWidget {
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
                    onPressed: () {}
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
        Text('Possessives',
            style: textStyle(Colors.black, 30)
        ),
        Container(
          height: screenHeight / 12
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            starsAndCheck(1),
            Row(
              children: [
                Text('5.1  singular possessives just add ',
                    style: textStyle(Colors.black, screenWidth / 29)
                ),
                Text('\'s',
                    style: textStyle(Colors.red, screenWidth / 29)
                ),
              ],
            )
          ],
        ),
        Container(
            height: screenHeight / 12
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            starsAndCheck(2),
            Row(
              children: [
                Text('5.2  plurals ending with ',
                    style: textStyle(Colors.black, screenWidth / 29)
                ),
                Text('s ',
                    style: textStyle(Colors.green, screenWidth / 29)
                ),
                Text('just add ',
                    style: textStyle(Colors.black, screenWidth / 29)
                ),
                Text('\'',
                    style: textStyle(Colors.red, screenWidth / 29)
                )
              ],
            )
          ],
        ),
        Container(
            height: screenHeight / 12
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            starsAndCheck(3),
            Row(
              children: [
                Text('5.3  irregular plurals add ',
                    style: textStyle(Colors.black, screenWidth / 29)
                ),
                Text('\'s',
                    style: textStyle(Colors.red, screenWidth / 29)
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
  if (StreakFive.checkmark[index]) {
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
  String imagePath = StreakFive.getImagePath(index);
  if (imagePath.length == 0) {
    return Container(
        width: screenWidth / 5,
        height: screenHeight / 12
    );
  }

  return Container(
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: Image.asset(StreakFive.getImagePath(index),
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