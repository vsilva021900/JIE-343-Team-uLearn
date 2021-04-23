import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/MainScoreMenu.dart';
import 'package:hearatale_literacy_app/nine/StreakNine.dart';
import '../../helper.dart';


class ScoreNine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

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
                child: Text('Suffixes',
                    style: textStyle(Colors.black, 30)
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(0),
                Row(
                  children: [
                    Text('9.1 ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('er ',
                        style: textStyle(Colors.green, screenWidth / 30)
                    ),
                    Text('or ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('or ',
                        style: textStyle(Colors.green, screenWidth / 30)
                    ),
                    Text('a person who',
                        style: textStyle(Colors.red, screenWidth / 30)
                    ),
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
                Text('          does something',
                    style: textStyle(Colors.red, screenWidth / 30)
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(1),
                Row(
                  children: [
                    Text('9.2 ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('ful ',
                        style: textStyle(Colors.green, screenWidth / 30)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('full of',
                        style: textStyle(Colors.red, screenWidth / 30)
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
                    Text('9.3 ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('less ',
                        style: textStyle(Colors.green, screenWidth / 30)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('without',
                        style: textStyle(Colors.red, screenWidth / 30)
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
                    Text('9.4 ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('able ',
                        style: textStyle(Colors.green, screenWidth / 30)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('can be ',
                        style: textStyle(Colors.red, screenWidth / 30)
                    ),
                    Text('or ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('able to be',
                        style: textStyle(Colors.red, screenWidth / 30)
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
                    Text('9.5 ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('en ',
                        style: textStyle(Colors.green, screenWidth / 30)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('made of ',
                        style: textStyle(Colors.red, screenWidth / 30)
                    ),
                    Text('or ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('to make',
                        style: textStyle(Colors.red, screenWidth / 30)
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
                    Text('9.6 ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('ly ',
                        style: textStyle(Colors.green, screenWidth / 30)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('done ',
                        style: textStyle(Colors.red, screenWidth / 30)
                    ),
                    Text('or ',
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
                Text('          happens a certain way',
                    style: textStyle(Colors.red, screenWidth / 30)
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(6),
                Row(
                  children: [
                    Text('9.7 ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('y ',
                        style: textStyle(Colors.green, screenWidth / 30)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('being ',
                        style: textStyle(Colors.red, screenWidth / 30)
                    ),
                    Text('or ',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                    Text('having',
                        style: textStyle(Colors.red, screenWidth / 30)
                    )
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
  if (StreakNine.checkmark[index]) {
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
  String imagePath = StreakNine.getImagePath(index);
  if (imagePath.length == 0) {
    return Container(
        width: screenWidth / 5,
        height: screenHeight / 12
    );
  }

  return Container(
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: Image.asset(StreakNine.getImagePath(index),
        fit: BoxFit.contain,
      )
  );
}