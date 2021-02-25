import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/main.dart';

class QuizThree extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizThree> {
  var answers = [
    // 3.1
    [
      ['dark', 'hard', 'quiet', 'small', 'strong', 'sweet', 'young', 'long'], // 3.1
      ['blue', 'large', 'little', 'nice', 'rude', 'strange', 'tame', 'wide'], // 3.2
      ['cranky', 'friendly', 'happy', 'icy', 'pretty', 'silly', 'sneaky', 'sorry'], // 3.3
      ['big', 'fat', 'flat', 'hot', 'red', 'sad', 'thin', 'wet'], // 3.4
    ],
    // 3.2
    [
      ['blue', 'large', 'little', 'nice', 'rude', 'strange', 'tame', 'wide'], // 3.2
      ['dark', 'hard', 'quiet', 'small', 'strong', 'sweet', 'young', 'long'], // 3.1
      ['cranky', 'friendly', 'happy', 'icy', 'pretty', 'silly', 'sneaky', 'sorry'], // 3.3
      ['big', 'fat', 'flat', 'hot', 'red', 'sad', 'thin', 'wet'], // 3.4
    ],
    // 3.3
    [
      ['cranky', 'friendly', 'happy', 'icy', 'pretty', 'silly', 'sneaky', 'sorry'], // 3.3
      ['dark', 'hard', 'quiet', 'small', 'strong', 'sweet', 'young', 'long'], // 3.1
      ['blue', 'large', 'little', 'nice', 'rude', 'strange', 'tame', 'wide'], // 3.2
      ['big', 'fat', 'flat', 'hot', 'red', 'sad', 'thin', 'wet'], // 3.4
    ],
    // 3.4
    [
      ['big', 'fat', 'flat', 'hot', 'red', 'sad', 'thin', 'wet'], // 3.4
      ['dark', 'hard', 'quiet', 'small', 'strong', 'sweet', 'young', 'long'], // 3.1
      ['blue', 'large', 'little', 'nice', 'rude', 'strange', 'tame', 'wide'], // 3.2
      ['cranky', 'friendly', 'happy', 'icy', 'pretty', 'silly', 'sneaky', 'sorry'], // 3.3
    ]
  ];
  var questionAudio = [
    '3.1_QwhichaddsERformoreESTformost.mp3', // 3.1
    '3.2_QwhichdropslastletteraddsERorEST.mp3', // 3.2
    '3.3_QwhichchangeslastlettertoIaddERorEST.mp3', // 3.3
    '3.4_QwhichDoubleslastletteraddsERandESTj.mp3', // 3.4
  ];
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int streak = 0; // first try correct answer streak
  int attempt = 0; // how many tries before answering correctly

  int counter = -1;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    answerOrder.shuffle();
    attempt = 0;
    counter = (counter + 1) % 4;

    if (prevCorrect < 0) {
      playAudio(questionAudio[0]);
      audioCache.loadAll(questionAudio);
    }

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
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => MyApp(),
                              transitionDuration: Duration(seconds: 0)
                          ), (route) => false);
                    },
                  )
              ),
              Spacer(flex: 5),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        playAudio(questionAudio[counter]);
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
            getQuestion(),
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
    int temp = random.nextInt(answers[counter][index].length);
    if (index == 0) {
      while (prevCorrect == temp) {
        temp = random.nextInt(answers[counter][0].length);
      }
      prevCorrect = temp;
    }
    return answers[counter][index][temp];
  }

  Column getQuestion() {
    //3.1 question
    if (counter == 0) {
      return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Which base word makes no other changes and',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('only adds ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('er',
                          style: textStyle(Colors.red, screenWidth / 24)
                      ),
                      Text(' to say more or ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('est',
                          style: textStyle(Colors.red, screenWidth / 24)
                      ),
                    ],
                  ),
                  Text('to say most?',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ],
              ),
            ],
      );
    }
    //3.2 question
    else if (counter == 1) {
      return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Which base word drops the last letter and',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('then adds ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('er',
                          style: textStyle(Colors.red, screenWidth / 24)
                      ),
                      Text(' to say more and ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('est',
                          style: textStyle(Colors.red, screenWidth / 24)
                      ),
                    ],
                  ),


                  Text('to say most?',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ],
              ),
            ],
      );
    }
    //3.3 question
    else if (counter == 2) {
      return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Which base word changes the last letter to',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('i',
                          style: textStyle(Colors.red, screenWidth / 24)
                      ),
                      Text(' and then adds ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('er',
                          style: textStyle(Colors.red, screenWidth / 24)
                      ),
                      Text(' to say more and ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('est',
                          style: textStyle(Colors.red, screenWidth / 24)
                      ),
                    ],
                  ),


                  Text('to say most?',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ],
              ),
            ],
      );
    }
    //3.4 question
    else {
      return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Which base doubles the last letter and',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('then adds ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('er',
                          style: textStyle(Colors.red, screenWidth / 24)
                      ),
                      Text(' to say more and ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('est',
                          style: textStyle(Colors.red, screenWidth / 24)
                      ),
                    ],
                  ),

                  Text('to say most?',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ],
              ),
            ],
      );
    }
  }

  playAudio(String path) async {
    stopAudio();
    audioPlayer = await audioCache.play(path);
  }
  stopAudio() {
    audioPlayer.stop();
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