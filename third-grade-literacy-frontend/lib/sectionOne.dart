import 'testing.dart';
import 'OnePointOneLesson.dart';
import 'package:flutter/material.dart';

class MainOne extends StatelessWidget {
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
    color: const Color(0xffd5f0f7),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // section title
        Text('Base Words and Endings - ed, ing',
          style: textStyle(Colors.black, 30)
        ),
        // subsections and clown
        Row (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1.1 and 1.2
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 1.1
                Row(
                  children: [
                    // spacer
                    Container(
                      width: screenHeight / 15,
                    ),
                    // 1.1
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, _, __) => OnePointOneLesson();

                            transitionDuration: Duration(seconds: 0)
                          )
                        );
                      },
                      child: Container(
                        constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                        child: Image.asset('assets/dropbox/Cropped/Icon_1.1.png',
                          fit: BoxFit.contain,
                        )
                    )
                    )
                  ]
                ),
                // effectively a spacer
                Container(
                  height: screenHeight / 25,
                ),
                // 1.2
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
                      constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                    child: Image.asset('assets/dropbox/Cropped/Icon_1.2.png',
                      fit: BoxFit.contain,
                    )
                  )
                )
              ],
            ),
            // Clown
            Container(
              constraints: BoxConstraints(maxHeight: screenHeight * 0.8, maxWidth: screenWidth * 0.4),
              child: Image.asset('assets/dropbox/Cropped/Clown_1.png',
                fit: BoxFit.contain,
              )
            ),
            // 1.3 and 1.4
            Column(
              children: [
                // 1.3
                Row(
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
                        constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                        child: Image.asset('assets/dropbox/Cropped/Icon_1.3.png',
                          fit: BoxFit.contain,
                        )
                      )
                    ),
                    Container(
                        width: screenHeight / 9
                    )
                  ],
                ),
                // effectively a spacer
                Container(
                  height: screenHeight / 8,
                ),
                // 1.4
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
                    constraints: BoxConstraints(maxHeight: screenHeight / 3, maxWidth: screenWidth / 4),
                    child: Image.asset('assets/dropbox/Cropped/Icon_1.4.png',
                      fit: BoxFit.contain,
                    )
                  )
                )
              ],
            )
          ],
        )
      ],
    )
  );
}



// class OnePointOne extends StatelessWidget {
//   OnePointOne(this.page);
//   final int page;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Material(
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             sideBarWithReplay(context),
//             Expanded(
//               child: lessonOneOne(context)
//             )
//           ],
//         )
//       )
//     );
//   }
// }

// Widget lessonOneOne(BuildContext context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       Text('Many action words just add ',
//           style: textStyle(Colors.black, 30)
//       ),
//       Text('ed ',
//           style: textStyle(Colors.red, 30)
//       ),
//       Text('and ',
//           style: textStyle(Colors.black, 30)
//       ),
//       Text('ing ',
//           style: textStyle(Colors.red, 30)
//       ),
//       Text('1.1   just add ',
//           style: textStyle(Colors.black, 20)
//       ),
//     ],
//   );
// }



/* helper functions and variables */
double screenHeight, screenWidth;
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}