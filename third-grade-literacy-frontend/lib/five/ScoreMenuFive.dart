import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/MainScoreMenu.dart';
import 'package:hearatale_literacy_app/five/StreakFive.dart';
import '../helper.dart';


class ScoreFive extends StatelessWidget {
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
          child: Text('Possessives',
              style: textStyle(Colors.black, 30)
          )
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