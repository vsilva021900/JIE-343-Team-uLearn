import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/MainScoreMenu.dart';
import 'package:hearatale_literacy_app/eight/StreakEight.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';


class ScoreEight extends StatelessWidget {
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
                child: Text('Prefixes',
                    style: textStyle(Colors.black, 40)
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(0),
                Row(
                  children: [
                    Text('8.1  ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('un ',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('not',
                        style: textStyle(Colors.red, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(1),
                Row(
                  children: [
                    Text('8.2  ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('dis ',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('not',
                        style: textStyle(Colors.red, screenWidth / 40)
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
                    Text('8.3  ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('in ',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('not',
                        style: textStyle(Colors.red, screenWidth / 40)
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
                    Text('8.4  ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('im ',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('not',
                        style: textStyle(Colors.red, screenWidth / 40)
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
                    Text('8.5  ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('re ',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text('can mean ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('again',
                        style: textStyle(Colors.red, screenWidth / 40)
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
                    Text('8.6  ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('mis ',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('wrongly ',
                        style: textStyle(Colors.red, screenWidth / 40)
                    ),
                    Text('or ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('badly',
                        style: textStyle(Colors.red, screenWidth / 40)
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(6),
                Row(
                  children: [
                    Text('8.7  ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('pre ',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('before',
                        style: textStyle(Colors.red, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(7),
                Row(
                  children: [
                    Text('8.8  ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('over ',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('too much',
                        style: textStyle(Colors.red, screenWidth / 40)
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                starsAndCheck(8),
                Row(
                  children: [
                    Text('8.9  ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('under ',
                        style: textStyle(Colors.green, screenWidth / 40)
                    ),
                    Text('means ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('too little ',
                        style: textStyle(Colors.red, screenWidth / 40)
                    ),
                    Text('or ',
                        style: textStyle(Colors.black, screenWidth / 40)
                    ),
                    Text('below',
                        style: textStyle(Colors.red, screenWidth / 40)
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
  if (StreakEight.checkmark[index]) {
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
  String imagePath = StreakEight.getImagePath(index);
  if (imagePath.length == 0) {
    return Container(
        width: screenWidth / 5,
        height: screenHeight / 12
    );
  }

  return Container(
      constraints: BoxConstraints(maxWidth: screenWidth / 5),
      child: Image.asset(StreakEight.getImagePath(index),
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