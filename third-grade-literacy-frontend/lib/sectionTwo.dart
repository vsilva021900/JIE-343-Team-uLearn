import 'testing.dart';
import 'package:flutter/material.dart';

class MainTwo extends StatelessWidget {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // section title
          Text('Base Words and Endings - s, ies, es',
              style: textStyle(Colors.black, 30)
          ),
          // 2.1 and 2.2
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 2.1
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
                  height: screenHeight / 4,
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.1.png',
                    fit: BoxFit.contain,
                  )
                )
              ),
              // 2.2
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
                  height: screenHeight / 4,
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.2.png',
                    fit: BoxFit.contain,
                  )
                )
              )
            ],
          ),
          // 2.3 and 2.4
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 2.3
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
                  height: screenHeight / 4,
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.3.png',
                    fit: BoxFit.contain,
                  )
                )
              ),
              // 2.4
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
                  height: screenHeight / 4,
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.4.png',
                    fit: BoxFit.contain,
                  )
                )
              )
            ],
          ),
          // 2.5 and 2.6
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 2.5
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
                  height: screenHeight / 4,
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.5.png',
                    fit: BoxFit.contain,
                  )
                )
              ),
              // 2.6
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
                  height: screenHeight / 4,
                  child: Image.asset('assets/dropbox/Cropped/Icon_2.6.png',
                    fit: BoxFit.contain,
                  )
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