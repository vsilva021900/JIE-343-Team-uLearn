import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Structures',
      theme: ThemeData(),
      home: Material(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            sideBar,
            Expanded(
              child: mainSections,
            )
          ],
        )
      )
    );
  }
}

Widget sideBar = Container(
  color: const Color(0xffc4e8e6),
  child: Column(
    children: <Widget>[
      Material(
        child: IconButton(
          icon: Image.asset('assets/placeholder_back_button.png'),
          onPressed: () {  },
        )
      ),
      Material(
        child: IconButton(
          icon: Image.asset('assets/placeholder_home_button.png'),
          onPressed: () {  },
        )
      ),
      Spacer(flex: 5),
      Material(
        child: IconButton(
          icon: Image.asset('assets/placeholder_piggy_button.png'),
          onPressed: () {  }
        )
      ),
    ]
  )
);

Widget mainSections = Container(
  color: const Color(0xff6ec6d4),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        'Word Structures',
        style: TextStyle(
          fontFamily: 'Comic',
          fontSize: 30,
        )
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            color: const Color(0xff96e4a2),
            child: Text('\n 1 \n Base Words and Endings \n ed ing \n',
              style: TextStyle(
                fontFamily: 'Comic',
                fontSize: 15
              ),
              textAlign: TextAlign.center,
            )
          ),
          Container(
              color: const Color(0xff66cf69),
              child: Text('\n 2 \n Base Words and Endings \n s es \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
          Container(
              color: const Color(0xfffdf885),
              child: Text('\n 3 \n Comparative \n Endings \n',
                style: TextStyle(
                    fontFamily: 'Comic',
                    fontSize: 15
                ),
                textAlign: TextAlign.center,
              )
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('4'),
          Text('5'),
          Text('6'),
          Text('7'),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('8'),
          Text('9'),
          Text('10'),
        ],
      )
    ],
  )
);
