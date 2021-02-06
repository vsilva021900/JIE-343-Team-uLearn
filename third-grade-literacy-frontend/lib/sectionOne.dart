import 'package:flutter/cupertino.dart';
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
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      // title
      Text('Base Words and Endings - ed, ing',
        style: textStyle(Colors.black, 30)
      ),
      // subsections and clown
      Row (
        children: [
          // 1.1 and 1.2
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: screenHeight / 4,
                height: screenHeight / 4,
                child: Image.asset('assets/dropbox/Cropped/Icon_1.1.png',
                  fit: BoxFit.contain,
                )
              ),
              Container(
                  width: screenHeight / 4,
                  height: screenHeight / 4,
                  child: Image.asset('assets/dropbox/Cropped/Icon_1.2.png',
                    fit: BoxFit.contain,
                  )
              )
            ],
          ),
          // Clown
          Image.asset('assets/dropbox/Cropped/Clown_1.png'),
          // 1.3 and 1.4
          Column(
            children: [
              Image.asset('assets/dropbox/Cropped/Icon_1.3.png'),
              Image.asset('assets/dropbox/Cropped/Icon_1.4.png')
            ],
          )
        ],
      )
    ],
  );
}



class OnePointOne extends StatelessWidget {
  OnePointOne(this.page);
  final int page;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            sideBarWithReplay(context),
            Expanded(
              child: lessonOneOne(context)
            )
          ],
        )
      )
    );
  }
}

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

Widget lessonOneOne(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text('Many action words just add ',
          style: textStyle(Colors.black, 30)
      ),
      Text('ed ',
          style: textStyle(Colors.red, 30)
      ),
      Text('and ',
          style: textStyle(Colors.black, 30)
      ),
      Text('ing ',
          style: textStyle(Colors.red, 30)
      ),
      Text('1.1   just add ',
          style: textStyle(Colors.black, 20)
      ),
    ],
  );
}



// helper functions and variables
double screenHeight, screenWidth;
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}