import 'testing.dart';
import 'package:flutter/material.dart';
import 'FourPointOneLesson.dart';
import 'FourPointTwoLesson.dart';
import 'FourPointThreeLesson.dart';
import 'FourPointFourLesson.dart';
import 'FourPointFiveLesson.dart';
import 'FourPointSixLesson.dart';
import 'FourPointSevenLesson.dart';
import 'FourPointEightLesson.dart';
import 'FourPointNineLesson.dart';
import 'FourPointTenLesson.dart';

class MainFour extends StatelessWidget {
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
                  onPressed: () {},
                )
            ),
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
      color: const Color(0xffccecf4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // section title
          Text('Plurals',
              style: textStyle(Colors.black, 30)
          ),
          // subsections and person
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 4.1, 4.2, 4.5, 4.8
              Column(
                children: [
                  // 4.1
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointOneLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth / 5),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.1.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // 4.2
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointTwoLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth / 5),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.2.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // 4.5
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointFiveLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth / 5),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.5.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // 4.8
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointEightLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth / 5),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.8.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                ],
              ),
              // 4.3, 4.6, 4.9
              Column(
                children: [
                  // 4.3
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointThreeLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth * 0.181),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.3.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // 4.6
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointSixLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth * 0.181),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.6.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // 4.9
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointNineLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth * 0.181),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.9.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                ],
              ),
              // 4.4, 4.7, 4.10
              Column(
                children: [
                  // 4.4
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointFourLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth * 0.179),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.4.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // 4.7
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointSevenLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth * 0.179),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.7.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                  // 4.10
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => FourPointTenLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          constraints: BoxConstraints(maxWidth: screenWidth * 0.179),
                          child: Image.asset('assets/dropbox/Cropped/Icon_4.10.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                ],
              ),
              // spacer
              Container(
                width: screenWidth / 15
              ),
              // person
              Container(
                  constraints: BoxConstraints(maxHeight: screenHeight * 0.8, maxWidth: screenWidth / 6),
                child: Image.asset('assets/dropbox/Cropped/Person_4.png',
                  fit: BoxFit.contain,
                )
              )
            ],
          )
        ],
      )
  );
}

/* helper functions and variables */
double screenHeight, screenWidth;
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}