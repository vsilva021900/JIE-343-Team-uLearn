import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: OnePointTwoLesson()
  ));
}
class OnePointTwoLesson extends StatefulWidget {
  @override
  OnePointTwo createState() => OnePointTwo();
}
class OnePointTwo extends State<OnePointTwoLesson> {
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
                    child: sub(context)
                )
              ],
            )
        )
    );
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

// same as above except include replay button for audio files
// use for lesson pages
Widget sideBarWithReplay(BuildContext context) {
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
                    icon: Image.asset('assets/placeholder_replay_button.png'),
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

Widget sub(BuildContext context) {
  tracker = 0;
  return Container(
      color: const Color(0xFFFFFF),
      child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // can probably simplify with RichText
                Text('Many actions words just add ',
                    style: textStyle(Colors.black, 30)
                ),
                Text('ed ',
                    style: textStyle(Colors.red, 30)
                ),
                Text('and ',
                    style: textStyle(Colors.black, 30)
                ),
                Text('ing',
                    style: textStyle(Colors.red, 30)
                ),
                Text(' to the',
                    style: textStyle(Colors.black, 30)
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(' base word without making any other changes.',
                    style: textStyle(Colors.black, 30)
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: screenHeight * 0.6,
                  child: Transform.scale(
                    scale: 1,
                    child: IconButton(
                      icon: Image.asset('assets/placeholder_back_button.png'),
                      onPressed: () {
                        tracker = (tracker - 1) & pictures.length;
                      },
                    ),
                  ),
                ),
                Container(
                    height: screenHeight * 0.6,
                    child: Image.asset(pictures[tracker],
                      height: 200,
                      width: 200,
                    )
                ),
                Container(
                  height: screenHeight * 0.6,
                  child: Transform.scale(
                    scale: 1,
                    child: IconButton(
                      icon: Image.asset('assets/placeholder_back_button_reversed.png'),
                      onPressed: () {
                        tracker = (tracker + 1) & pictures.length;
                      },
                    ),
                  ),
                )
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    child:
                    Text(words[tracker][0], style: textStyle(Colors.black, 30))
                ),
                Container (
                    child:
                    Text(words[tracker][1], style: textStyle(Colors.black, 30))
                ),
                Container (
                    child:
                    Text(words[tracker][2], style: textStyle(Colors.black, 30))
                )
              ],
            )
          ]
      )
  );
}

var pictures = ['assets/dropbox/sectionOne/OnePointTwo/drop.png',
  'assets/dropbox/sectionOne/OnePointTwo/fib.png',
  'assets/dropbox/sectionOne/OnePointTwo/hug.png',
  'assets/dropbox/sectionOne/OnePointTwo/nap.png',
  'assets/dropbox/sectionOne/OnePointTwo/skip.png',
  'assets/dropbox/sectionOne/OnePointTwo/stop.png'];
var words = [['drop', 'dropped', 'dropping'],
  ['fib', 'fibbed', "fibbing"],
  ['hug', 'hugged', "hugging"],
  ['nap', 'napped', "napping"],
  ['skip', 'skipped', "skipping"],
  ['stop', 'stopped', "stopping"]];
int tracker;
double screenHeight, screenWidth;
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}
}
