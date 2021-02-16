import 'dart:math';

import 'package:flutter/material.dart';

class QuizOnePointOne extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizOnePointOne> {
  var answers = [
    ['talk', 'jump', 'paint', 'fix', 'own', 'help'], // 1.1
    ['nap', 'skip', 'hug', 'drop', 'fib', 'stop'], // 1.2
    ['dance', 'excite', 'tickle', 'bake', 'move', 'tumble'], // 1.3
    ['cry', 'try', 'carry', 'fry', 'empty', 'dirty'] // 1.4
  ];
  var answerOrder = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    answerOrder.shuffle();
    print(answerOrder);

    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
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
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        // audioCache.play(music[tracker]);
                      }
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

  Widget sub(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Which word makes no other change but just',
                        style: textStyle(Colors.black, screenWidth / 24)
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('add ',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
                    Text('ed ',
                        style: textStyle(Colors.red, screenWidth / 24)
                    ),
                    Text('and ',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
                    Text('ing ',
                        style: textStyle(Colors.red, screenWidth / 24)
                    ),
                    Text('to the base word?',
                        style: textStyle(Colors.black, screenWidth / 24)
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Box 0
                Container(
                    width: screenWidth * 0.3,
                    decoration: boxDecoration(),
                    child: padding(getChoice(0), screenWidth / 24)
                ),
                // Box 1
                Container(
                    width: screenWidth * 0.3,
                    decoration: boxDecoration(),
                    child: padding(getChoice(1), screenWidth / 24)
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Box 2
                Container(
                    width: screenWidth * 0.3,
                    decoration: boxDecoration(),
                    child: padding(getChoice(2), screenWidth / 24)
                ),
                // Box 3
                Container(
                    width: screenWidth * 0.3,
                    decoration: boxDecoration(),
                    child: padding(getChoice(3), screenWidth / 24)
                ),
              ],
            )
          ],
        )
    );
  }

  String getChoice(int boxNum) {
    return answers[answerOrder[boxNum]][random.nextInt(6)];
  }
}


double screenHeight, screenWidth;
var random = new Random();


Padding padding(String text, double size) {
  return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        text,
        style: textStyle(Colors.black, size),
        textAlign: TextAlign.center,
      )
  );
}
BoxDecoration boxDecoration() {
  return BoxDecoration(
    color: const Color(0xff00eeff),
    border: Border.all(color: const Color(0xff008cb3), width: 3),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
}
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}