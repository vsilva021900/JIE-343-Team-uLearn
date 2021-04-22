import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/six/ScoreMenuSix.dart';
import 'package:hearatale_literacy_app/six/StreakSix.dart';
import 'package:hearatale_literacy_app/Rewards.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';
import 'dart:math';


class QuizSixPointEight extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizSixPointEight> {
  var answers = [true, false];

  String questionAudio = "dropbox/SectionSix/SixPointEight/#6.8_QclickYESifiscontractionNOifnot_useifquizsententcecuedafterquizgegins.mp3";
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();

  var answerOrder = [0, 1, 2, 3];
  bool first = true; // to determine whether to play question audio

  int index = 7; // for calling StreakSix methods
  int attempt = 0; // how many tries before answering correctly

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    answerOrder.shuffle();
    attempt = 0;

    if (first) {
      audioCache.load(questionAudio);
      playAudio(questionAudio);
    }
    first = false;

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
                              pageBuilder: (context, _, __) => ScoreSix(),
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
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => PiggyBank(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      }
                  )
              ),
            ]
        )
    );
  }

  Widget sub(BuildContext context) {
    int randNum = random.nextInt(16);
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createSentence(randNum),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Box 0
                GestureDetector(
                    onTap: () {
                      // if the choice is correct
                      if (randNum % 2 == 1) {
                        // if this is the first try
                        if (attempt == 0) {
                          // increase correct answer streak
                          StreakSix.correct(index);
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      // choice is not correct
                      else {
                        // increment attempt counter
                        attempt += 1;
                        // reset correct answer streak
                        StreakSix.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding("yes", screenWidth / 24)
                    )
                ),
                // Box 1
                GestureDetector(
                    onTap: () {
                      if (randNum % 2 == 0) {
                        if (attempt == 0) {
                          StreakSix.correct(index);
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakSix.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: boxDecoration(),
                        child: padding("no", screenWidth / 24)
                    )
                ),
              ],
            ),
            Column(
              children: [
                Text('Click yes if the blue word is a contraction,',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('no if the blue word is not a contraction.',
                        style: textStyle(Colors.black, screenWidth / 24)
                    )
                  ],
                ),
              ],
            ),
          ],
        )
    );
  }

  playAudio(String path) async {
    stopAudio();
    audioPlayer = await audioCache.play(path);
  }
  stopAudio() {
    audioPlayer.stop();
  }
  Column createSentence(int randNum) {
    if (randNum == 1) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('The ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("dog's ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("(dog is) on the dog’s bed ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('(on the bed belonging to the dog).',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ]
            ),
          ]
      );
    } else if (randNum == 2) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The dog's (dog is) on the ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("dog's ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("bed",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('(on the bed belonging to the dog).',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ]
            ),
          ]
      );
    } else if (randNum == 3) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("boy’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("jumping on the boy’s pogo stick.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 4) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The boy’s jumping on the ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("boy’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("pogo stick.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 5) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("cat’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("brushing the cat’s face.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 6) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The cat’s brushing the ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("cat’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("face.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 7) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("dad’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("holding the dad’s little girl.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 8) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The dad’s holding the ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("dad’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("little girl.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 9) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("girl’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("showing off the girl’s new purse.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 10) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The girl’s showing off the ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("girl’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("new purse.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 11) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("orangutan’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("hanging down by the",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("orangutan’s arm.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ]
            ),
          ]
      );
    } else if (randNum == 12) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The orangutan’s hanging down by the ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("orangutan’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("arm.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 13) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("seal’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("balancing a ball on the seal’s nose.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 14) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The seal’s balancing a ball on the ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("seal’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("nose.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else if (randNum == 15) {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("vet’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("busy with the vet’s patients.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    } else {
      return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The vet’s busy with the ",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text("vet’s ",
                      style: textStyle(Colors.blue, screenWidth / 24)
                  ),
                  Text("patients.",
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ]
            ),
          ]
      );
    }
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