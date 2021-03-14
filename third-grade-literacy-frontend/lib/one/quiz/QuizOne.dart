import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/StreakMain.dart';
import 'package:hearatale_literacy_app/one/ScoreMenuOne.dart';
import 'package:hearatale_literacy_app/one/StreakOne.dart';


class QuizOne extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizOne> {
  var answers = [
    // 1.1
    [ ['fix', 'help', 'jump', 'own', 'paint', 'talk'], // 1.1
      ['nap', 'skip', 'hug', 'drop', 'fib', 'stop'], // 1.2
      ['dance', 'excite', 'tickle', 'bake', 'move', 'tumble'], // 1.3
      ['cry', 'try', 'carry', 'fry', 'empty', 'dirty'] // 1.4
    ],
    // 1.2
    [ ['nap', 'skip', 'hug', 'drop', 'fib', 'stop'], // 1.2
      ['fix', 'help', 'jump', 'own', 'paint', 'talk'], // 1.1
      ['dance', 'excite', 'tickle', 'bake', 'move', 'tumble'], // 1.3
      ['cry', 'try', 'carry', 'fry', 'empty', 'dirty'] // 1.4
    ],
    // 1.3
    [ ['dance', 'excite', 'tickle', 'bake', 'move', 'tumble'], // 1.3
      ['fix', 'help', 'jump', 'own', 'paint', 'talk'], // 1.1
      ['nap', 'skip', 'hug', 'drop', 'fib', 'stop'], // 1.2
      ['cry', 'try', 'carry', 'fry', 'empty', 'dirty'] // 1.4
    ],
    [ ['cry', 'try', 'carry', 'fry', 'empty', 'dirty'], // 1.4
      ['dance', 'excite', 'tickle', 'bake', 'move', 'tumble'], // 1.3
      ['fix', 'help', 'jump', 'own', 'paint', 'talk'], // 1.1
      ['nap', 'skip', 'hug', 'drop', 'fib', 'stop'], // 1.2
    ],
  ];
  var questionAudio = [
    'dropbox/sectionOne/OnePointOne/#1.1_QwhichwordjustaddsEDorING.mp3', // 1.1
    'dropbox/sectionOne/OnePointTwo/#1.2_QwhichdoublesconsonantaddsEDorING.mp3', // 1.2
    'dropbox/sectionOne/OnePointThree/#1.3_QdropsfinalletterandaddsEDorING.mp3', // 1.3
    'dropbox/sectionOne/OnePointFour/#1.4_QfinallettertoIbutjustaddsING.mp3' // 1.4
  ];
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int index = 0; // for calling StreakMain methods
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
      audioCache.loadAll(questionAudio);
      playAudio(questionAudio[0]);
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
                      stopAudio();
                      Navigator.pop(context);
                    },
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_home_button.png'),
                    onPressed: () {
                      stopAudio();
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
                    icon: Image.asset('assets/star_button.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => ScoreOne(),
                              transitionDuration: Duration(seconds: 0)
                          )
                      );
                    },
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
                          StreakMain.correct(index);
                        }
                        stopAudio();
                        setState(() {});
                      }
                      // choice is not correct
                      else {
                        // increment attempt counter
                        attempt += 1;
                        // reset correct answer streak
                        StreakMain.incorrect(index);
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
                          StreakMain.correct(index);
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakMain.incorrect(index);
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
                          StreakMain.correct(index);
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakMain.incorrect(index);
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
                          StreakMain.correct(index);
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakMain.incorrect(index);
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
    if (counter == 0) {
      return Column(
        children: [
          Text('Which word makes no other change but just',
              style: textStyle(Colors.black, screenWidth / 24)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('adds ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('ed ',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text('or ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('ing ',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text('to the base word?',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
            ],
          ),
        ],
      );
    }
    else if (counter == 1) {
      return Column(
        children: [
          Text('Which word doubles the final consonant and',
              style: textStyle(Colors.black, screenWidth / 24)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('adds ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('ed ',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text('or ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('ing ',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text('to the base word?',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
            ],
          ),
        ],
      );
    }
    else if (counter == 2){
      return Column(
        children: [
          Text('Which action word drops the final letter',
              style: textStyle(Colors.black, screenWidth / 24)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('and adds ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('ed ',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text('or ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('ing ',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text('to the base word?',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
            ],
          ),
        ],
      );
    }
    else {
      return Column(
        children: [
          Text('Which action word changes the final letter',
              style: textStyle(Colors.black, screenWidth / 24)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('to',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text(' i ',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text('to add ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('ed',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text(', but keeps the final letter',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('to add ',
                  style: textStyle(Colors.black, screenWidth / 24)
              ),
              Text('ing',
                  style: textStyle(Colors.red, screenWidth / 24)
              ),
              Text(' to the base word?',
                  style: textStyle(Colors.black, screenWidth / 24)
              )
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