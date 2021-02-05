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
      home: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          sideBar,
          Expanded(
            child: mainSections,
          )
        ],
      ),
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
    children: <Widget>[
      Text('Word Structures'),
      Row(
        children: [
          Text('1'),
          Text('2')
        ],
      )
    ],
  )
);
