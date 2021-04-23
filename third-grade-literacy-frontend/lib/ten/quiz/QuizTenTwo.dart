import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/ten/ScoreMenuTen.dart';
import 'package:hearatale_literacy_app/ten/StreakTen.dart';
import 'package:hearatale_literacy_app/Rewards.dart';
import '../../helper.dart';


class QuizTenTwo extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizTenTwo> {
  var answers = [
    ['father', 'mother', 'teacher', 'football', 'baboon', 'robot', 'giraffe', 'spyglass',
      'parrot', 'firetruck', 'poodle', 'doctor', 'apple', 'taco', 'wagon', 'tiger', 'spider'], // 2 Syllables
    ['boy', 'girl', 'kid', 'bat', 'chimp', 'doll', 'elk', 'eye', 'hawk',
      'boy', 'girl', 'kid', 'bat', 'chimp', 'doll', 'elk', 'eye'], // 1 Syllable
    ['grandfather', 'grandmother', 'principal', 'basketball', 'gorilla', 'teddybear', 'kangaroo', 'sunglasses',
      'grandfather', 'grandmother', 'principal', 'basketball', 'gorilla', 'teddybear', 'kangaroo', 'sunglasses', 'principal'], // 3 Syllable
    ['jeep', 'mutt', 'nurse', 'plum', 'soup', 'trike', 'wolf', 'wasp',
      'cardinal', 'bulldozer', 'dalmation', 'physician', 'pineapple', 'hamburger', 'bicycle', 'rattlesnake', 'centipede'], // 1 or 3 Syllable
  ];
  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int index = 2; // first try correct answer streak
  int attempt = 0; // how many tries before answering correctly

  String questionAudio = 'dropbox/SectionTen/#10_Q_2_whichwordhasTWOsyllables.mp3';

  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    answerOrder.shuffle();
    attempt = 0;

    if (prevCorrect < 0) {
      playAudio();
      audioCache.load(questionAudio);
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
              backButton(context),
              homeButton(context),
              Spacer(flex: 5),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        playAudio();
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
              pinkPigButton(context)
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
                Text('Which word has TWO syllables?',
                    style: textStyle(Colors.black, screenWidth / 24)
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
                          StreakTen.correct(index);
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
                        StreakTen.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: answerDecoration(),
                        child: answerPadding(getChoice(0), screenWidth / 24)
                    )
                ),
                // Box 1
                GestureDetector(
                    onTap: () {
                      if (answerOrder[1] == 0) {
                        if (attempt == 0) {
                          StreakTen.correct(index);
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakTen.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: answerDecoration(),
                        child: answerPadding(getChoice(1), screenWidth / 24)
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
                          StreakTen.correct(index);
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakTen.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: answerDecoration(),
                        child: answerPadding(getChoice(2), screenWidth / 24)
                    )
                ),
                // Box 3
                GestureDetector(
                    onTap: () {
                      if (answerOrder[3] == 0) {
                        if (attempt == 0) {
                          StreakTen.correct(index);
                          Rewards.addGoldCoin();
                        } else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakTen.incorrect(index);
                      }
                    },
                    child: Container(
                        width: screenWidth * 0.3,
                        decoration: answerDecoration(),
                        child: answerPadding(getChoice(3), screenWidth / 24)
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

  playAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(questionAudio);
  }
}
