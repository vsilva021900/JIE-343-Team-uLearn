import 'package:flutter/material.dart';
import 'testing.dart';

class MainEight extends StatelessWidget {
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
      color: const Color(0xffffb482),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        height: screenHeight / 3.75,
                        child: Image.asset('assets/dropbox/Cropped/Icon_8.1.png',
                          fit: BoxFit.fitHeight,
                        )
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Spacer
                    Container(
                        width: screenWidth * 0.028
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
                            height: screenHeight / 3.55,
                            child: Image.asset('assets/dropbox/Cropped/Icon_8.4.png',
                              fit: BoxFit.fitHeight,
                            )
                        )
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
                        height: screenHeight / 3.55,
                        child: Image.asset('assets/dropbox/Cropped/Icon_8.8.png',
                          fit: BoxFit.fitHeight,
                        )
                    )
                ),
              ]
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                        width: screenWidth * 0.15
                    ),
                    Text('Prefixes',
                        style: textStyle(Colors.black, 30)
                    ),
                  ],
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: screenHeight / 5.8,
                                child: Image.asset('assets/dropbox/Cropped/Frisbee_8.png',
                                  fit: BoxFit.fitHeight,
                                )
                            ),
                            //Spacer
                            Container(
                                height: screenHeight * 0.06
                            ),
                            Container(
                                height: screenHeight / 5.5,
                                child: Image.asset('assets/dropbox/Cropped/Volleyball_8.png',
                                  fit: BoxFit.fitHeight,
                                )
                            ),
                          ]
                      ),
                      Container(
                          width: screenWidth * 0.055
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
                              height: screenHeight / 3.55,
                              child: Image.asset('assets/dropbox/Cropped/Icon_8.2.png',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: screenWidth * 0.06
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
                              height: screenHeight / 3.55,
                              child: Image.asset('assets/dropbox/Cropped/Icon_8.5.png',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                      Container(
                          width: screenWidth * 0.03
                      ),
                      Column(
                          children: [
                            Container(
                                height: screenHeight * 0.06
                            ),
                            Container(
                                height: screenHeight * 0.125,
                                child: Image.asset('assets/dropbox/Cropped/Donuts_8.png',
                                  fit: BoxFit.fitHeight,
                                )
                            ),
                          ]
                      ),

                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: screenHeight / 5.8,
                          child: Image.asset('assets/dropbox/Cropped/Target_8.png',
                            fit: BoxFit.fitHeight,
                          )
                      ),
                      Container(
                          width: screenWidth * 0.07
                      ),
                      Container(
                          height: screenHeight / 6,
                          child: Image.asset('assets/dropbox/Cropped/Drum_8.png',
                            fit: BoxFit.fitHeight,
                          )
                      ),
                    ]
                ),
              ]
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: screenWidth * 0.05
                      ),
                      Column(
                          children: [
                            Container(
                                height: screenHeight * 0.18
                            ),
                            Container(
                                height: screenHeight / 5,
                                child: Image.asset('assets/dropbox/Cropped/Soccerball_8.png',
                                  fit: BoxFit.fitHeight,
                                )
                            ),
                          ]
                      ),
                      Container(
                          width: screenWidth * 0.05
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
                              height: screenHeight / 3.55,
                              child: Image.asset('assets/dropbox/Cropped/Icon_8.3.png',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              height: screenHeight / 3.55,
                              child: Image.asset('assets/dropbox/Cropped/Icon_8.6.png',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                      Column(
                          children: [
                            Container(
                                height: screenHeight * 0.1,
                                child: Image.asset('assets/dropbox/Cropped/Tire_8.png',
                                  fit: BoxFit.fitHeight,
                                )
                            ),
                            Container(
                                height: screenHeight * 0.15
                            ),
                            Row(
                              children: [
                                Container(
                                    width: screenWidth * 0.035
                                ),
                                Container(
                                    height: screenHeight * 0.075,
                                    child: Image.asset('assets/dropbox/Cropped/Penny_8.png',
                                      fit: BoxFit.fitHeight,
                                    )
                                ),
                              ],
                            ),

                          ]
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
                              height: screenHeight / 3.4,
                              child: Image.asset('assets/dropbox/Cropped/Icon_8.7.png',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: screenHeight / 4.5,
                          child: Image.asset('assets/dropbox/Cropped/Basketball_8.png',
                            fit: BoxFit.fitHeight,
                          )
                      ),
                      Container(
                          width: screenWidth * 0.075
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
                              height: screenHeight / 3.55,
                              child: Image.asset('assets/dropbox/Cropped/Icon_8.9.png',
                                fit: BoxFit.fitHeight,
                              )
                          )
                      ),
                    ]
                ),
              ]
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