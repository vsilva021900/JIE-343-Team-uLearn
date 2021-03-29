import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'testing.dart';
import 'WordStructures.dart';

class MainTen extends StatelessWidget {
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
                    onPressed: () {}
                )
            ),
            Material(
                color: const Color(0xffc4e8e6),
                child: IconButton(
                  icon: Image.asset('assets/star_button.png'),
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     PageRouteBuilder(
                    //         pageBuilder: (context, _, __) => Test(),
                    //         transitionDuration: Duration(seconds: 0)
                    //     )
                    // );
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
      color: const Color(0xffbefcf5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: screenHeight * 0.65,
              child: Image.asset('assets/dropbox/Cropped/BigTriangle_10_fix.png',
                fit: BoxFit.fitHeight,
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
                            pageBuilder: (context, _, __) => Test(),
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
                            pageBuilder: (context, _, __) => Test(),
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
                                pageBuilder: (context, _, __) => Test(),
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
                                pageBuilder: (context, _, __) => Test(),
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

double screenHeight, screenWidth;
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}