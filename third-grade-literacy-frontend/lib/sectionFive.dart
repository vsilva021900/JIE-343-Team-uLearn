import 'package:flutter/material.dart';
import 'five/FivePointOneLesson.dart';
import 'five/FivePointTwoLesson.dart';
import 'five/FivePointThreeLesson.dart';
import 'five/ScoreMenuFive.dart';
import 'helper.dart';

class MainFive extends StatelessWidget {
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
                    child: subSections(context)
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
            Material(
                color: const Color(0xffc4e8e6),
                child: IconButton(
                    icon: Image.asset('assets/placeholder_quiz_button.png'),
                    onPressed: () {}
                )
            ),
            Material(
                color: const Color(0xffc4e8e6),
                child: IconButton(
                  icon: Image.asset('assets/star_button.png'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => ScoreFive(),
                            transitionDuration: Duration(seconds: 0)
                        )
                    );
                  },
                )
            ),
            pinkPigButton(context)
          ]
      )
  );
}

Widget subSections(BuildContext context) {
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // section title
          Text('Possessives',
              style: textStyle(Colors.black, 30)
          ),
          // subsections
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 5.1
              Column(
                children: [
                  // 5.1
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FivePointOneLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                          child: Image.asset('assets/dropbox/Cropped/Icon_5.1.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // creature
                  Row(
                    children: [
                      // spacer
                      Container(
                        width: screenWidth / 9,
                      ),
                      // creature 5.1
                      Container(
                          constraints: BoxConstraints(maxHeight: screenHeight * 0.4, maxWidth: screenWidth / 6),
                          child: Image.asset('assets/dropbox/Cropped/Creature_5.1.png',
                            fit: BoxFit.contain,
                          )
                      )
                    ],
                  )
                ],
              ),
              // 5.2
              Column(
                children: [
                  // 5.2
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FivePointTwoLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                          child: Image.asset('assets/dropbox/Cropped/Icon_5.2.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // creature
                  Row(
                    children: [
                      // creature 5.1
                      Container(
                          constraints: BoxConstraints(maxHeight: screenHeight * 0.4, maxWidth: screenWidth / 6),
                          child: Image.asset('assets/dropbox/Cropped/Creature_5.2.png',
                            fit: BoxFit.contain,
                          )
                      ),
                      Container(
                        width: screenWidth / 12,
                      ),
                    ],
                  )
                ],
              ),
              // 5.3
              Column(
                children: [
                  // 5.3
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FivePointThreeLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                          child: Image.asset('assets/dropbox/Cropped/Icon_5.3.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // creature
                  Row(
                    children: [
                      // creature 5.1
                      Container(
                          constraints: BoxConstraints(maxHeight: screenHeight * 0.4, maxWidth: screenWidth / 6),
                          child: Image.asset('assets/dropbox/Cropped/Creature_5.3.png',
                            fit: BoxFit.contain,
                          )
                      ),
                      Container(
                        width: screenWidth / 8,
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      )
  );
}
