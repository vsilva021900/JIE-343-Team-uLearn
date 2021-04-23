import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/four/ScoreMenuFour.dart';
import 'package:hearatale_literacy_app/four/StreakFour.dart';
import 'package:hearatale_literacy_app/Rewards.dart';
import 'package:hearatale_literacy_app/helper.dart';
import 'package:hearatale_literacy_app/globals.dart' as globals;



class QuizFourPointNine extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizFourPointNine> {
  var answers =         [
    ['octopus', 'cactus', 'hippopotamus', 'rhinoceros'], //4.9
    ['bubble', 'cookie', 'creature', 'frog', 'giraffe', 'puddle', 'stripe', 'vehicle'], //4.1
    ['bus', 'dress', 'glass', 'guess', 'kiss', 'walrus', //4.2
      'blush', 'dish', 'splash', 'bush', 'eyelash', 'brush', 'radish', //4.3
      'crutch', 'peach', 'itch', 'scratch', 'ostrich', 'watch'], //4.4
    ['elf', 'loaf', 'knife', 'thief', 'leaf', 'wolf', //4.7
      'box', 'six', 'fox', 'wax', 'lynx', 'mix', //4.5
      'baby', 'fairy', 'spy', 'berry', 'fly', 'bunny', 'pony'] //4.6
  ];
  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int index = 9; // first try correct answer streak
  int attempt = 0; // how many tries before answering correctly

  String questionAudio = '4.9_QwhichfunwordschangetoItomakeaplural.mp3';

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
                              pageBuilder: (context, _, __) => ScoreFour(),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Which fun words change ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('us ',
                          style: textStyle(Colors.green, screenWidth / 24)
                      ),
                      Text('or ',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                      Text('os ',
                          style: textStyle(Colors.green, screenWidth / 24)
                      ),
                      Text('at the end of',
                          style: textStyle(Colors.black, screenWidth / 24)
                      ),
                    ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('the base word into ',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
                    Text('i ',
                        style: textStyle(Colors.red, screenWidth / 24)
                    ),
                    Text('to make a plural?',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
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
                        globals.pushUserDataForFocusItem(attempt + 1, "Quiz 4.9");
                        // if this is the first try
                        if (attempt == 0) {
                          // increase correct answer streak
                          StreakFour.correct(index);
                          Rewards.addGoldCoin();
                        }
                        else if (attempt == 1) {
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
                        StreakFour.incorrect(index);
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
                        globals.pushUserDataForFocusItem(attempt + 1, "Quiz 4.9");
                        if (attempt == 0) {
                          StreakFour.correct(index);
                          Rewards.addGoldCoin();
                        }
                        else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakFour.incorrect(index);
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
                        globals.pushUserDataForFocusItem(attempt + 1, "Quiz 4.9");
                        if (attempt == 0) {
                          StreakFour.correct(index);
                          Rewards.addGoldCoin();
                        }
                        else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakFour.incorrect(index);
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
                        globals.pushUserDataForFocusItem(attempt + 1, "Quiz 4.9");
                        if (attempt == 0) {
                          StreakFour.correct(index);
                          Rewards.addGoldCoin();
                        }
                        else if (attempt == 1) {
                          Rewards.addSilverCoin();
                        }
                        stopAudio();
                        setState(() {});
                      }
                      else {
                        attempt += 1;
                        StreakFour.incorrect(index);
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
