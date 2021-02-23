import 'package:flutter/material.dart';
import 'testing.dart';

class MainNine extends StatelessWidget {
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
      color: const Color(0xffa7dfed),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: screenWidth * 0.7,
                    child: Image.asset('assets/dropbox/Cropped/Top_9.png',
                      fit: BoxFit.fitHeight,
                    )
                ),
              ]
          ),
          //Spacer
          Container(
              height: screenHeight * 0.06
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: screenHeight / 5.25,
                  child: Image.asset('assets/dropbox/Cropped/Bear_9.png',
                    fit: BoxFit.fitWidth,
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
                      child: Image.asset('assets/dropbox/Cropped/Icon_9.1.png',
                        fit: BoxFit.fitWidth,
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
                      child: Image.asset('assets/dropbox/Cropped/Icon_9.2.png',
                        fit: BoxFit.contain,
                      )
                  )
              ),
              //Spacer
              Container(
                  width: screenWidth * 0.009
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
                      child: Image.asset('assets/dropbox/Cropped/Icon_9.3.png',
                        fit: BoxFit.contain,
                      )
                  )
              ),
              Container(
                  height: screenHeight / 5.25,
                  child: Image.asset('assets/dropbox/Cropped/Fox_9.png',
                    fit: BoxFit.contain,
                  )
              ),
            ]
          ),
          //Spacer
          Container(
              height: screenHeight * 0.06
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  height: screenHeight * 0.121,
                  child: Image.asset('assets/dropbox/Cropped/Caterpillar_9.png',
                    fit: BoxFit.fitHeight,
                  )
              ),
            ]
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          height: screenHeight / 4.95,
                          child: Image.asset('assets/dropbox/Cropped/Icon_9.4.png',
                            fit: BoxFit.fitHeight,
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
                          child: Image.asset('assets/dropbox/Cropped/Icon_9.5.png',
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
                          child: Image.asset('assets/dropbox/Cropped/Icon_9.6.png',
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
                          height: screenHeight / 4.95,
                          child: Image.asset('assets/dropbox/Cropped/Icon_9.7.png',
                            fit: BoxFit.contain,
                          )
                      )
                  ),
                ],
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: screenWidth * 0.7,
                    child: Image.asset('assets/dropbox/Cropped/Bottom_9.png',
                      fit: BoxFit.fitHeight,
                    )
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