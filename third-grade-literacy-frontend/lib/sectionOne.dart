import 'package:flutter/material.dart';
import 'one/OnePointOneLesson.dart';
import 'one/OnePointTwoLesson.dart';
import 'one/OnePointThreeLesson.dart';
import 'one/OnePointFourLesson.dart';
import 'one/quiz/QuizOne.dart';
import 'one/ScoreMenuOne.dart';
import 'helper.dart';


class MainOne extends StatelessWidget {
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => QuizOne(),
                              transitionDuration: Duration(seconds: 0)
                          )
                      );
                    }
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
                            pageBuilder: (context, _, __) => ScoreOne(),
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
    color: const Color(0xffd5f0f7),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // section title
        Text('Base Words and Endings - ed, ing',
          style: textStyle(Colors.black, 30)
        ),
        // subsections and clown
        Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1.1 and 1.2
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 1.1
                Row(
                  children: [
                    // spacer
                    Container(
                      width: screenHeight / 15,
                    ),
                    // 1.1
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, _, __) => OnePointOneLesson(),

                            transitionDuration: Duration(seconds: 0)
                          )
                        );
                      },
                      child: Container(
                        constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                        child: Image.asset('assets/dropbox/Cropped/Icon_1.1.png',
                          fit: BoxFit.contain,
                        )
                    )
                    )
                  ]
                ),
                // effectively a spacer
                Container(
                  height: screenHeight / 25,
                ),
                // 1.2
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, _, __) => OnePointTwoLesson(),
                        transitionDuration: Duration(seconds: 0)
                      )
                    );
                  },
                  child: Container(
                      constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                    child: Image.asset('assets/dropbox/Cropped/Icon_1.2.png',
                      fit: BoxFit.contain,
                    )
                  )
                )
              ],
            ),
            // Clown
            Container(
              constraints: BoxConstraints(maxHeight: screenHeight * 0.8, maxWidth: screenWidth * 0.4),
              child: Image.asset('assets/dropbox/Cropped/Clown_1.png',
                fit: BoxFit.contain,
              )
            ),
            // 1.3 and 1.4
            Column(
              children: [
                // 1.3
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, _, __) => OnePointThreeLesson(),
                            transitionDuration: Duration(seconds: 0)
                          )
                        );
                      },
                      child: Container(
                        constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                        child: Image.asset('assets/dropbox/Cropped/Icon_1.3.png',
                          fit: BoxFit.contain,
                        )
                      )
                    ),
                    Container(
                        width: screenHeight / 9
                    )
                  ],
                ),
                // effectively a spacer
                Container(
                  height: screenHeight / 8,
                ),
                // 1.4
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, _, __) => OnePointFourLesson(),
                        transitionDuration: Duration(seconds: 0)
                      )
                    );
                  },
                  child: Container(
                    constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                    child: Image.asset('assets/dropbox/Cropped/Icon_1.4.png',
                      fit: BoxFit.contain,
                    )
                  )
                )
              ],
            )
          ],
        )
      ],
    )
  );
}