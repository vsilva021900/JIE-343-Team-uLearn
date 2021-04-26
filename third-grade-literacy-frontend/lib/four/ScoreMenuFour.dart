import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/MainScoreMenu.dart';
import 'package:hearatale_literacy_app/four/StreakFour.dart';
import '../helper.dart';


class ScoreFour extends StatelessWidget {
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
                child: Text('Plurals',
                    style: textStyle(Colors.black, 30)
                )
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(1),
                Row(
                  children: [
                    Text('4.1  just add ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('s',
                        style: textStyle(Colors.red, screenWidth / 40)
                    ),
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(2),
                Row(
                  children: [
                    Text('4.2  end with ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('s',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text(', add ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(3),
                Row(
                  children: [
                    Text('4.3  end with ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('sh',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text(', add ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(4),
                Row(
                  children: [
                    Text('4.4  end with ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('ch',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text(', add ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(5),
                Row(
                  children: [
                    Text('4.5  end with ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('x',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text(', add ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(6),
                Row(
                  children: [
                    Text('4.6  end with ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('y',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text(', change to ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('i ',
                        style: textStyle(Colors.red, screenWidth / 40)
                    ),
                    Text('add ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(7),
                Row(
                  children: [
                    Text('4.7  end with ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('f',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text(', change to ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('v ',
                        style: textStyle(Colors.red, screenWidth / 40)
                    ),
                    Text('add ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(8),
                Row(
                  children: [
                    Text('4.8  irregular plurals',
                        style: textStyle(Colors.black, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(9),
                Row(
                  children: [
                    Text("4.9  fun plurals most people don't know",
                        style: textStyle(Colors.black, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Container(
                height: screenHeight / 200
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(10),
                Row(
                  children: [
                    Text('4.10  plural same as singular',
                        style: textStyle(Colors.black, screenWidth / 40)
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
  if (StreakFour.checkmark[index]) {
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
  String imagePath = StreakFour.getImagePath(index);
  if (imagePath.length == 0) {
    return Container(
        width: screenWidth / 5,
        height: screenHeight / 12
    );
  }

  return Container(
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: Image.asset(StreakFour.getImagePath(index),
        fit: BoxFit.contain,
      )
  );
}