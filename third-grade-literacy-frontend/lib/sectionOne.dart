import 'package:flutter/material.dart';

class MainOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // can probably simplify with RichText
          Text('Base Words and Endings - ',
            style: textStyle(Colors.black, 30)
          ),
          Text('ed',
            style: textStyle(Colors.red, 30)
          ),
          Text(', ',
            style: textStyle(Colors.black, 30)
          ),
          Text('ing',
              style: textStyle(Colors.red, 30)
          )
        ],
      ),
      // section 1.1
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, _, __) => OnePointOne(1),
                  transitionDuration: Duration(seconds: 0)
              )
          );
        },
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1.1   just add ',
            style: textStyle(Colors.black, 20)
          ),
          Text('ed ',
              style: textStyle(Colors.red, 20)
          ),
          Text('or ',
              style: textStyle(Colors.black, 20)
          ),
          Text('ing ',
              style: textStyle(Colors.red, 20)
          ),
        ],
      ),
      ),
      // section 1.2
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1.2   double final constant, add ',
              style: textStyle(Colors.black, 20)
          ),
          Text('ed ',
              style: textStyle(Colors.red, 20)
          ),
          Text('or ',
              style: textStyle(Colors.black, 20)
          ),
          Text('ing ',
              style: textStyle(Colors.red, 20)
          ),
        ],
      ),
      // section 1.3
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1.3   drop final ',
              style: textStyle(Colors.black, 20)
          ),
          Text('e',
              style: textStyle(Colors.green, 20)
          ),
          Text(', add ',
              style: textStyle(Colors.black, 20)
          ),
          Text('ed ',
              style: textStyle(Colors.red, 20)
          ),
          Text('or ',
              style: textStyle(Colors.black, 20)
          ),
          Text('ing ',
              style: textStyle(Colors.red, 20)
          ),
        ],
      ),
      // section 1.4
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('1.4   change ',
              style: textStyle(Colors.black, 20)
          ),
          Text('y ',
              style: textStyle(Colors.green, 20)
          ),
          Text('to ',
              style: textStyle(Colors.black, 20)
          ),
          Text('i ',
              style: textStyle(Colors.red, 20)
          ),
          Text('add ',
              style: textStyle(Colors.black, 20)
          ),
          Text('ed',
              style: textStyle(Colors.red, 20)
          ),
          Text(', keep ',
              style: textStyle(Colors.black, 20)
          ),
          Text('y ',
              style: textStyle(Colors.green, 20)
          ),
          Text('add ',
              style: textStyle(Colors.black, 20)
          ),
          Text('ing ',
              style: textStyle(Colors.red, 20)
          ),
        ],
      ),
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
  return Container(
    child: Text('Testing')
  );
}



TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}