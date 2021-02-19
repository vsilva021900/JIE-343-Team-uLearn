import 'dart:math';

import 'package:flutter/material.dart';

class QuizTwoPointTwo extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizTwoPointTwo> {
  var answers = [
    ['bully', 'carry', 'cry', 'dirty', 'fly', 'spy', 'try'], // 2.2
    ['help', 'jump', 'kick', 'sing', 'sleep', 'talk', 'think', 'work'], // 2.1
    ['catch', 'hitch', 'scratch', 'teach', 'touch', 'watch', // 2.3
    'guess', 'hiss', 'kiss', 'miss', 'pass', 'toss'], // 2.4
    ['crash', 'fish', 'push', 'vanish', 'wash', 'wish', // 2.5
    'box', 'fix', 'mix', 'relax', 'wax'] // 2.6
  ];
  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int streak = 0; // first try correct answer streak
  int attempt = 0; // how many tries before answering correctly

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    answerOrder.shuffle();
    attempt = 0;

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
                Text('To say someone or something does something,',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Text('which action word changes the final letter to',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('i ',
                        style: textStyle(Colors.red, screenWidth / 24)
                    ),
                    Text('and adds ',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 24)
                    ),
                    Text('?',
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
                GestureDetector(
                  onTap: () {
                    // if the choice is correct
                    if (answerOrder[0] == 0) {
                      // if this is the first try
                      if (attempt == 0) {
                        // increase correct answer streak
                        streak += 1;
                      }
                      setState(() {});
                    }
                    // choice is not correct
                    else {
                      // increment attempt counter
                      attempt += 1;
                      // reset correct answer streak
                      streak = 0;
                    }
                  },
                  child: Container(
                    width: screenWidth * 0.3,
                    decoration: boxDecoration(),
                    child: padding(getChoice(0), screenWidth / 24)
                  )
                ),
                // Box 1
                GestureDetector(
                  onTap: () {
                    if (answerOrder[1] == 0) {
                      if (attempt == 0) {
                        streak += 1;
                      }
                      setState(() {});
                    }
                    else {
                      attempt += 1;
                      streak = 0;
                    }
                  },
                  child: Container(
                    width: screenWidth * 0.3,
                    decoration: boxDecoration(),
                    child: padding(getChoice(1), screenWidth / 24)
                  )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Box 2
                GestureDetector(
                  onTap: () {
                    if (answerOrder[2] == 0) {
                      if (attempt == 0) {
                        streak += 1;
                      }
                      setState(() {});
                    }
                    else {
                      attempt += 1;
                      streak = 0;
                    }
                  },
                  child: Container(
                    width: screenWidth * 0.3,
                    decoration: boxDecoration(),
                    child: padding(getChoice(2), screenWidth / 24)
                  )
                ),
                // Box 3
                GestureDetector(
                  onTap: () {
                    if (answerOrder[3] == 0) {
                      if (attempt == 0) {
                        streak += 1;
                      }
                      setState(() {});
                    }
                    else {
                      attempt += 1;
                      streak = 0;
                    }
                  },
                  child: Container(
                    width: screenWidth * 0.3,
                    decoration: boxDecoration(),
                    child: padding(getChoice(3), screenWidth / 24)
                  )
                ),
              ],
            )
          ],
        )
    );
  }

  String getChoice(int boxNum) {
    int index = answerOrder[boxNum];
    int temp = random.nextInt(answers[index].length);
    if (index == 0) {
      while (prevCorrect == temp) {
        temp = random.nextInt(answers[0].length);
      }
      prevCorrect = temp;
    }
    return answers[index][temp];
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