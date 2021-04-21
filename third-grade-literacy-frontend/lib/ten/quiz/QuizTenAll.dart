import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/StreakMain.dart';
import 'package:hearatale_literacy_app/ten/ScoreMenuTen.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/Rewards.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';


class QuizTenAll extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizTenAll> {
  var answers = [
    // 1 Syllable
    [
      ['boy', 'girl', 'kid', 'bat', 'chimp', 'doll', 'elk', 'eye', 'hawk',
        'jeep', 'mutt', 'nurse', 'plum', 'soup', 'trike', 'wolf', 'wasp'], // 1 Syllable
      ['father', 'mother', 'teacher', 'football', 'baboon', 'robot', 'giraffe', 'spyglass',
        'father', 'mother', 'teacher', 'football', 'baboon', 'robot', 'giraffe', 'spyglass', 'father'], // 2 Syllables
      ['grandfather', 'grandmother', 'principal', 'basketball', 'gorilla', 'teddybear', 'kangaroo', 'sunglasses',
        'grandfather', 'grandmother', 'principal', 'basketball', 'gorilla', 'teddybear', 'kangaroo', 'sunglasses', 'centipede'], // 3 Syllables
      ['parrot', 'firetruck', 'poodle', 'doctor', 'apple', 'taco', 'wagon', 'tiger', 'spider',
        'cardinal', 'bulldozer', 'dalmation', 'physician', 'pineapple', 'hamburger', 'bicycle', 'rattlesnake'], // 2 or 3 Syllables
    ],
    // 2 Syllables
    [
      ['father', 'mother', 'teacher', 'football', 'baboon', 'robot', 'giraffe', 'spyglass',
        'parrot', 'firetruck', 'poodle', 'doctor', 'apple', 'taco', 'wagon', 'tiger', 'spider'], // 2 Syllables
      ['boy', 'girl', 'kid', 'bat', 'chimp', 'doll', 'elk', 'eye', 'hawk',
        'boy', 'girl', 'kid', 'bat', 'chimp', 'doll', 'elk', 'eye'], // 1 Syllable
      ['grandfather', 'grandmother', 'principal', 'basketball', 'gorilla', 'teddybear', 'kangaroo', 'sunglasses',
        'grandfather', 'grandmother', 'principal', 'basketball', 'gorilla', 'teddybear', 'kangaroo', 'sunglasses', 'principal'], // 3 Syllable
      ['jeep', 'mutt', 'nurse', 'plum', 'soup', 'trike', 'wolf', 'wasp',
        'cardinal', 'bulldozer', 'dalmation', 'physician', 'pineapple', 'hamburger', 'bicycle', 'rattlesnake', 'centipede'], // 1 or 3 Syllable
    ],
    // 3 Syllables
    [
      ['grandfather', 'grandmother', 'principal', 'basketball', 'gorilla', 'teddybear', 'kangaroo', 'sunglasses',
        'cardinal', 'bulldozer', 'dalmation', 'physician', 'pineapple', 'hamburger', 'bicycle', 'rattlesnake', 'centipede'], // 3 Syllables
      ['father', 'mother', 'teacher', 'football', 'baboon', 'robot', 'giraffe', 'spyglass',
        'father', 'mother', 'teacher', 'football', 'baboon', 'robot', 'giraffe', 'spyglass', 'father'], // 2 Syllables
      ['great-grandfather', 'great-grandmother', 'custodian', 'aerialist', 'orangutan', 'marionette', 'rhinoceros', 'binoculars',
        'oystercatcher', 'great-grandfather', 'great-grandmother', 'custodian', 'aerialist', 'orangutan', 'marionette', 'rhinoceros', 'binoculars'], // 4 Syllables
      ['parrot', 'firetruck', 'poodle', 'doctor', 'apple', 'taco', 'wagon', 'tiger', 'spider', 'convertible', 'weimaraner',
        'psychologist', 'watermelon', 'macaroni', 'unicycle', 'alligator', 'caterpillar'], // 2 or 4 Syllables
    ],
    // 4 Syllables
    [
      ['great-grandfather', 'great-grandmother', 'custodian', 'aerialist', 'orangutan', 'marionette', 'rhinoceros', 'binoculars',
        'oystercatcher', 'convertible', 'weimaraner', 'psychologist', 'watermelon', 'macaroni', 'unicycle', 'alligator', 'caterpillar'], // 4 Syllables
      ['father', 'mother', 'teacher', 'football', 'baboon', 'robot', 'giraffe', 'spyglass',
        'father', 'mother', 'teacher', 'football', 'baboon', 'robot', 'giraffe', 'spyglass', 'father'], // 2 Syllables
      ['grandfather', 'grandmother', 'principal', 'basketball', 'gorilla', 'teddybear', 'kangaroo', 'sunglasses',
        'grandfather', 'grandmother', 'principal', 'basketball', 'gorilla', 'teddybear', 'kangaroo', 'sunglasses', 'centipede'], // 3 Syllables
      ['parrot', 'firetruck', 'poodle', 'doctor', 'apple', 'taco', 'wagon', 'tiger', 'spider',
        'cardinal', 'bulldozer', 'dalmation', 'physician', 'pineapple', 'hamburger', 'bicycle', 'rattlesnake'], // 2 or 3 Syllables
    ]
  ];
  var questionAudio = [
    'dropbox/SectionTen/#10_Q_1_whichwordONEsyllable.mp3', // 1 Syllable
    'dropbox/SectionTen/#10_Q_2_whichwordhasTWOsyllables.mp3', // 2 Syllables
    'dropbox/SectionTen/#10_Q_3_whichhasTHREEsyllables.mp3', // 3 Syllables
    'dropbox/SectionTen/#10_Q_4_whichwordhasFOURsyllables.mp3', // 4 Syllables
  ];
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int index = 9; // for calling StreakMain methods
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
                    icon: Image.asset('assets/star_button.png'),
                    onPressed: () {
                      stopAudio();
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => ScoreTen(),
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
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
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
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
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
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
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
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
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
    //3.1 question
    if (counter == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text('Which word has ONE syllable?',
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
              Text('Which word has TWO syllables?',
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
              Text('Which word has THREE syllables?',
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
              Text('Which has FOUR syllables?',
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