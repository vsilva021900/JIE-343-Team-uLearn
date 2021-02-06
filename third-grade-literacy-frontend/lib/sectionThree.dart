import 'testing.dart';
import 'package:flutter/material.dart';

class MainThree extends StatelessWidget {
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
      color: const Color(0xffc4e9f2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // section title
          Text('Comparative Endings',
              style: textStyle(Colors.black, 30)
          ),
          // 3.3, 3.1, Clown, 3.4, 3.5
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 3.3
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
                      width: screenWidth / 8,
                      child: Image.asset('assets/dropbox/Cropped/Icon_3.3.png',
                        fit: BoxFit.contain,
                      )
                  )
              ),
              // 3.1
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
                      width: screenWidth / 8,
                      child: Image.asset('assets/dropbox/Cropped/Icon_3.1.png',
                        fit: BoxFit.contain,
                      )
                  )
              ),
              // Clown
              Container(
                height: screenHeight * 0.8,
                child: Image.asset('assets/dropbox/Cropped/Clown_3.png',
                  fit: BoxFit.contain,
                )
              ),
              // 3.4
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
                      width: screenWidth / 8,
                      child: Image.asset('assets/dropbox/Cropped/Icon_3.4.png',
                        fit: BoxFit.contain,
                      )
                  )
              ),
              // 3.2
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
                      width: screenWidth / 8,
                      child: Image.asset('assets/dropbox/Cropped/Icon_3.2.png',
                        fit: BoxFit.contain,
                      )
                  )
              ),
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