import 'package:flutter/material.dart';
import 'testing.dart';

class MainSeven extends StatelessWidget {
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
                child: IconButton(
                  icon: Image.asset('assets/placeholder_back_button.png'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
            ),
            Material(
                child: IconButton(
                  icon: Image.asset('assets/placeholder_home_button.png'),
                  onPressed: () {},
                )
            ),
            Spacer(flex: 5),
            Material(
                child: IconButton(
                    icon: Image.asset('assets/placeholder_quiz_button.png'),
                    onPressed: () {}
                )
            ),
            Material(
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
      color: const Color(0xffffffff),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              height: screenHeight / 2.25,
                              child: Image.asset('assets/dropbox/Cropped/Icon_7.1.png',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: screenHeight * 0.075
                          ),
                          Text('compound',
                              style: textStyle(Colors.black, 30)
                          ),
                          Text('words',
                              style: textStyle(Colors.black, 30)
                          ),
                        ],
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
                              height: screenHeight / 2.25,
                              child: Image.asset('assets/dropbox/Cropped/Icon_7.2.png',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                              height: screenHeight / 2.25,
                              child: Image.asset('assets/dropbox/Cropped/Icon_7.3.png',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                    ],
                  ),
                ]
            )
          ]
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