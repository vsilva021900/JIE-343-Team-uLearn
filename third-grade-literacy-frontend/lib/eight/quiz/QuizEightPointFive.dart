import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/eight/ScoreMenuEight.dart';
import 'package:hearatale_literacy_app/eight/StreakEight.dart';


class QuizEightPointFive extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizEightPointFive> {
  var answers = [
    [ "redone", "repaint", "relight", "remove", "reread", "replace"], // 8.5
    ['fix', 'help', 'jump', 'own', 'paint', 'talk', // 1.1
      'nap', 'skip', 'hug', 'drop', 'fib', 'stop', // 1.2
      'dance', 'excite', 'tickle', 'bake', 'move', 'tumble', // 1.3
      'cry', 'try', 'carry', 'fry', 'empty', 'dirty'], // 1.4
    ['help', 'jump', 'kick', 'sing', 'sleep', 'talk', 'think', 'work', // 2.1
      'bully', 'carry', 'cry', 'dirty', 'fly', 'spy', 'try', // 2.2
      'catch', 'hitch', 'scratch', 'teach', 'touch', 'watch', // 2.3
      'guess', 'hiss', 'kiss', 'miss', 'pass', 'toss', // 2.4
      'crash', 'fish', 'push', 'vanish', 'wash', 'wish', // 2.5
      'box', 'fix', 'mix', 'relax', 'wax'], // 2.6
    ["painful", "hopeful", "careful", "joyful", "cheerful", "colorful", // 9.2
      "fearless", "clueless", "boneless", "harmless", "colorless", "tasteless"] // 9.3
  ];

  String questionAudio = "dropbox/SectionEight/EightPointFive/#8.5_QWhichWordHasAPrefixThatCantMeanAgain.mp3";
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();

  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int index = 0; // for calling StreakNine methods
  int attempt = 0; // how many tries before answering correctly

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    answerOrder.shuffle();
    attempt = 0;

    if (prevCorrect < 0) {
      audioCache.load(questionAudio);
      playAudio(questionAudio);
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
                        playAudio(questionAudio);
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/star_button.png'),
                    onPressed: () {
                      stopAudio();
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => ScoreEight(),
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
                      onPressed: () {
                        stopAudio();
                      }
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
                Text('The prefix ',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('re ',
                        style: textStyle(Colors.green, screenWidth / 24)
                    ),
                    Text('can mean ',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
                    Text('again',
                        style: textStyle(Colors.red, screenWidth / 24)
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
                          StreakEight.correct(index);
                        }
                        stopAudio();
                        setState(() {});
                      }
                      // choice is not correct
                      else {
                        // increment attempt counter
                        attempt += 1;
                        // reset correct answer streak
                        StreakEight.incorrect(index);
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
                          StreakEight.correct(index);
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakEight.incorrect(index);
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
                          StreakEight.correct(index);
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakEight.incorrect(index);
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
                          StreakEight.correct(index);
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakEight.incorrect(index);
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