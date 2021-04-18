import 'package:flutter/material.dart';

import 'WordStructures.dart';
import 'six/SixPointOneLesson.dart';
import 'six/SixPointTwoLesson.dart';
import 'six/SixPointThreeLesson.dart';
import 'six/SixPointFourLesson.dart';
import 'six/SixPointFiveLesson.dart';
import 'six/SixPointSixLesson.dart';
import 'six/SixPointSevenLesson.dart';
import 'six/SixPointEightLesson.dart';
import 'six/quiz/QuizSix.dart';
import 'six/ScoreMenuSix.dart';


class MainSix extends StatelessWidget {
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
                    icon: Image.asset('assets/placeholder_quiz_button.png'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, _, __) => QuizSix(),
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
                            pageBuilder: (context, _, __) => ScoreSix(),
                            transitionDuration: Duration(seconds: 0)
                        )
                    );
                  },
                )
            ),
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

Widget subSections(BuildContext context) {
  return Container(
      color: const Color(0xffbfe8d3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  height: screenHeight,
                  child: Image.asset('assets/dropbox/Cropped/Left_6.png',
                    fit: BoxFit.fitHeight,
                  )
              ),
            ]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: screenHeight * 0.2052,
                  child: Image.asset('assets/dropbox/Cropped/Top_6.png',
                    fit: BoxFit.fitHeight,
                  )
              ),
              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, _, __) => SixPointOneLesson(),
                                    transitionDuration: Duration(seconds: 0)
                                )
                            );
                          },
                          child: Container(
                              height: screenHeight * 0.2,
                              child: Image.asset('assets/dropbox/Cropped/Icon_6.1.jpg',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                      Container(
                          height: screenHeight * 0.2,
                          child: Image.asset('assets/dropbox/Cropped/MiddleTop_6.jpg',
                            fit: BoxFit.fitHeight,
                          )
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, _, __) => SixPointTwoLesson(),
                                    transitionDuration: Duration(seconds: 0)
                                )
                            );
                          },
                          child: Container(
                              height: screenHeight * 0.2,
                              child: Image.asset('assets/dropbox/Cropped/Icon_6.2.jpg',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, _, __) => SixPointThreeLesson(),
                                    transitionDuration: Duration(seconds: 0)
                                )
                            );
                          },
                          child: Container(
                              height: screenHeight * 0.2039,
                              child: Image.asset('assets/dropbox/Cropped/Icon_6.3.jpg',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, _, __) => SixPointFourLesson(),
                                    transitionDuration: Duration(seconds: 0)
                                )
                            );
                          },
                          child: Container(
                              height: screenHeight * 0.2039,
                              child: Image.asset('assets/dropbox/Cropped/Icon_6.4.jpg',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, _, __) => SixPointFiveLesson(),
                                    transitionDuration: Duration(seconds: 0)
                                )
                            );
                          },
                          child: Container(
                              height: screenHeight * 0.202,
                              child: Image.asset('assets/dropbox/Cropped/Icon_6.5.jpg',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, _, __) => SixPointSixLesson(),
                                    transitionDuration: Duration(seconds: 0)
                                )
                            );
                          },
                          child: Container(
                              height: screenHeight * 0.2039,
                              child: Image.asset('assets/dropbox/Cropped/Icon_6.6.jpg',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, _, __) => SixPointSevenLesson(),
                                    transitionDuration: Duration(seconds: 0)
                                )
                            );
                          },
                          child: Container(
                              height: screenHeight * 0.2039,
                              child: Image.asset('assets/dropbox/Cropped/Icon_6.7.jpg',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, _, __) => SixPointEightLesson(),
                                    transitionDuration: Duration(seconds: 0)
                                )
                            );
                          },
                          child: Container(
                              height: screenHeight * 0.2039,
                              child: Image.asset('assets/dropbox/Cropped/Icon_6.8.jpg',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                  height: screenHeight * 0.187,
                  child: Image.asset('assets/dropbox/Cropped/Bottom_6.png',
                    fit: BoxFit.fitHeight,
                  )
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: screenHeight,
                  child: Image.asset('assets/dropbox/Cropped/Right_6.png',
                    fit: BoxFit.fitHeight,
                  )
              ),
            ],
          ),
        ]
      ),
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