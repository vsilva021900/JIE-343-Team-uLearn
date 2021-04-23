import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/five/ScoreMenuFive.dart';
import 'package:hearatale_literacy_app/five/StreakFive.dart';
import 'package:hearatale_literacy_app/Rewards.dart';
import 'package:hearatale_literacy_app/helper.dart';


class QuizFivePointThree extends StatefulWidget {
  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<QuizFivePointThree> {
  var answers = [
    ["the children's teacher", "the feet's big toes",
      "the geese's beaks", "the men's hands", "the mice's tails",
      "the people's hands", "the teeth's color", "the women's faces"
    ], // 5.3
    ["the boot's bootstring", "the child's book",
      "the dog's hot dog", "the dress's collar", "the elf's lantern",
      "the firefly's head", "the flower's stem", "the foot's toenails",
      "the fox's tail", "the goose's feet", "the man's saw",
      "the mouse's nose", "the peach's seed", "the person's guitar",
      "the tooth's point", "the woman's headband", "the worker's hardhat",
    ],
    ["thieves", "watches",
      "wolves", "puddles", "vehicles",
      "itches", "giraffes", "crutches",
      "bubbles", "cookies",
      "creatures", "frogs", "elves",
      "knives", "leaves", "ostriches",
      "peaches", "scratches", "stripes"
    ],
    ["he'll", "I'll",
      "she'll", "they'll", "we'll",
      "you'll", "couldn't", "isn't",
      "weren't", "can't", "didn't",
      "doesn't", "shouldn't", "wasn't",
      "won't", "wouldn't"
    ]
  ];
  var answerOrder = [0, 1, 2, 3];
  int prevCorrect = -1; // prevent same correct answer multiple times in a row

  int index = 3; // for calling StreakFive methods
  int attempt = 0; // how many tries before answering correctly

  String questionAudio = 'dropbox/sectionFive/FivePointThree/#5.3_Qwhichmeansmorethanonehassomething.mp3';

  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    answerOrder.shuffle();
    attempt = 0;

    if (prevCorrect < 0) {
      audioCache.load(questionAudio);
      playAudio();
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
                              pageBuilder: (context, _, __) => ScoreFive(),
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
                Text('Which means more than one person',
                    style: textStyle(Colors.black, screenWidth / 24)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('or thing has something?',
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
                          StreakFive.correct(index);
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
                        StreakFive.incorrect(index);
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
                          StreakFive.correct(index);
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
                        StreakFive.incorrect(index);
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
                          StreakFive.correct(index);
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
                        StreakFive.incorrect(index);
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
                          StreakFive.correct(index);
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
                        StreakFive.incorrect(index);
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
