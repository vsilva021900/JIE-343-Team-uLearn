import 'package:flutter/material.dart';
import 'ten/TenAllLesson.dart';
import 'ten/TenOneLesson.dart';
import 'ten/TenTwoLesson.dart';
import 'ten/TenThreeLesson.dart';
import 'ten/TenFourLesson.dart';
import 'ten/quiz/QuizTenAll.dart';
import 'ten/ScoreMenuTen.dart';
import 'helper.dart';


class MainTen extends StatelessWidget {
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
                              pageBuilder: (context, _, __) => QuizTenAll(),
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
                             pageBuilder: (context, _, __) => ScoreTen(),
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
      color: const Color(0xffbefcf5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              width: screenWidth / 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) => TenAllLesson(),
                        transitionDuration: Duration(seconds: 0)
                    )
                );
              },
              child: Container(
                  height: screenHeight * 0.65,
                  child: Image.asset('assets/dropbox/Cropped/BigTriangle_10_fix.png',
                    fit: BoxFit.fitHeight,
                  )
              )
          ),
          Row(
            children: [
              //Spacer
              Container(
                  width: screenWidth / 37
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => TenOneLesson(),
                            transitionDuration: Duration(seconds: 0)
                        )
                    );
                  },
                  child: Container(
                      width: screenHeight / 2.8,
                      height: screenHeight / 3,
                      child: Image.asset('assets/dropbox/Cropped/Icon_10.1.png',
                        fit: BoxFit.fitHeight,
                      )
                  )
              ),
              //Spacer
              Container(
                  width: screenWidth / 23.5
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) => TenTwoLesson(),
                            transitionDuration: Duration(seconds: 0)
                        )
                    );
                  },
                  child: Container(
                      width: screenHeight / 3,
                      height: screenHeight / 3,
                      child: Image.asset('assets/dropbox/Cropped/Icon_10.2.png',
                        fit: BoxFit.fitHeight,
                      )
                  )
              ),
              //Spacer
              Container(
                  width: screenWidth / 22.5
              ),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => TenThreeLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          width: screenHeight / 3.5,
                          height: screenHeight / 3.65,
                          child: Image.asset('assets/dropbox/Cropped/Icon_10.3.png',
                            fit: BoxFit.fitHeight,
                          )
                      )
                  ),
                  //Spacer
                  Container(
                      height: screenHeight / 15
                  ),
                ],
              ),
              //Spacer
              Container(
                  width: screenWidth / 17
              ),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => TenFourLesson(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      },
                      child: Container(
                          width: screenHeight / 2.98,
                          height: screenHeight / 3.38,
                          child: Image.asset('assets/dropbox/Cropped/Icon_10.4.png',
                            fit: BoxFit.fitHeight,
                          )
                      )
                  ),
                  //Spacer
                  Container(
                      height: screenHeight / 22.5
                  ),
                ],
              ),

            ],
          ),
        ],
      )
  );
}
