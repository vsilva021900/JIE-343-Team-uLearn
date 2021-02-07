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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
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
                      height: screenHeight / 4.75,
                      child: Image.asset('assets/dropbox/Cropped/Icon_8.1.png',
                        fit: BoxFit.contain,
                      )
                  )
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
                      height: screenHeight / 4.75,
                      child: Image.asset('assets/dropbox/Cropped/Icon_8.4.png',
                        fit: BoxFit.contain,
                      )
                  )
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
                      height: screenHeight / 4.75,
                      child: Image.asset('assets/dropbox/Cropped/Icon_8.8.png',
                        fit: BoxFit.contain,
                      )
                  )
              ),
            ]
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Prefixes',
                  style: textStyle(Colors.black, 30)
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
                              height: screenHeight * 0.1,
                              child: Image.asset('assets/dropbox/Cropped/Frisbee_8.png',
                                fit: BoxFit.contain,
                              )
                          ),
                          Container(
                              height: screenHeight * 0.1,
                              child: Image.asset('assets/dropbox/Cropped/Soccerball_8.png',
                                fit: BoxFit.contain,
                              )
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
                            height: screenHeight / 4.75,
                            child: Image.asset('assets/dropbox/Cropped/Icon_8.2.png',
                              fit: BoxFit.contain,
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
                            height: screenHeight / 4.75,
                            child: Image.asset('assets/dropbox/Cropped/Icon_8.5.png',
                              fit: BoxFit.contain,
                            )
                        )
                    ),
                    Container(
                        height: screenHeight * 0.1,
                        child: Image.asset('assets/dropbox/Cropped/Donuts_8.png',
                          fit: BoxFit.contain,
                        )
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: screenHeight * 0.1,
                        child: Image.asset('assets/dropbox/Cropped/Target_8.png',
                          fit: BoxFit.contain,
                        )
                    ),
                    Container(
                        height: screenHeight * 0.1,
                        child: Image.asset('assets/dropbox/Cropped/Drum_8.png',
                          fit: BoxFit.contain,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: screenHeight * 0.1,
                        child: Image.asset('assets/dropbox/Cropped/Soccerball_8.png',
                          fit: BoxFit.contain,
                        )
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
                            height: screenHeight / 4.75,
                            child: Image.asset('assets/dropbox/Cropped/Icon_8.3.png',
                              fit: BoxFit.contain,
                            )
                        )
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: screenHeight * 0.1,
                        child: Image.asset('assets/dropbox/Cropped/Tire_8.png',
                          fit: BoxFit.contain,
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
                            height: screenHeight / 4.75,
                            child: Image.asset('assets/dropbox/Cropped/Icon_8.6.png',
                              fit: BoxFit.contain,
                            )
                        )
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
                            height: screenHeight / 4.75,
                            child: Image.asset('assets/dropbox/Cropped/Icon_8.7.png',
                              fit: BoxFit.contain,
                            )
                        )
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: screenHeight * 0.1,
                        child: Image.asset('assets/dropbox/Cropped/Penny_8.png',
                          fit: BoxFit.contain,
                        )
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: screenHeight * 0.1,
                        child: Image.asset('assets/dropbox/Cropped/Basketball_8.png',
                          fit: BoxFit.contain,
                        )
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
                            height: screenHeight / 4.75,
                            child: Image.asset('assets/dropbox/Cropped/Icon_8.9.png',
                              fit: BoxFit.contain,
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