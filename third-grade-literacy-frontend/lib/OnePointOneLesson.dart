import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: OnePointOne()
  ));
}
class OnePointOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  return Column(
    children: [
      // title
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
    ]
  );
}
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}