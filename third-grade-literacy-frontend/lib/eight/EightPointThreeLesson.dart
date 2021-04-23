import 'package:flutter/material.dart';
import 'ScoreMenuEight.dart';
import 'quiz/QuizEightPointThree.dart';
import '../helper.dart';


class EightPointThreeLesson extends StatefulWidget {
  @override
  EightPointThree createState() => EightPointThree();
}

class EightPointThree extends State<EightPointThreeLesson> {
  var pictures = [
    "assets/dropbox/SectionEight/EightPointThree/inactive.png",
    "assets/dropbox/SectionEight/EightPointThree/incapable.png",
    "assets/dropbox/SectionEight/EightPointThree/incomplete.png",
    "assets/dropbox/SectionEight/EightPointThree/incorrect.png",
    "assets/dropbox/SectionEight/EightPointThree/inhuman.png",
    "assets/dropbox/SectionEight/EightPointThree/invisible.png",
  ];
  var words = [
    ["in", "active", "inactive"],
    ["in", "capable", "incapable"],
    ["in", "complete", "incomplete"],
    ["in", "correct", "incorrect"],
    ["in", "human", "human"],
    ["in", "visible", "invisible"],
  ];
  var wordsAudio = [
    "dropbox/SectionEight/EightPointThree/in_active_inactive.mp3",
    "dropbox/SectionEight/EightPointThree/in_capable_incapable.mp3",
    "dropbox/SectionEight/EightPointThree/in_complete_incomplete.mp3",
    "dropbox/SectionEight/EightPointThree/in_correct_incorrect.mp3",
    "dropbox/SectionEight/EightPointThree/in_human_inhuman.mp3",
    "dropbox/SectionEight/EightPointThree/in_visible_invisible.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  String sentenceAudio = "dropbox/SectionEight/EightPointThree/#8.3_theprefixINmeansNOT.mp3";

  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

    if (marker) {
      marker = false;
      playSentenceAudio();
    }

    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                sideBarWithReplay(context),
                Expanded(
                    child: sub(context)
                )
              ],
            )
        )
    );
  }

  Widget sideBarWithReplay(BuildContext context) {
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
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {
                        stopAudio();
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => QuizEightPointThree(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        playWordsAudio();
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
              pinkPigButton(context)
            ]
        )
    );
  }

  Widget sub(BuildContext context) {
    return Container(
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('The prefix ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('in ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('means ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('not ',
                      style: textStyle(Colors.red, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenHeight * 0.6,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == 0)? pictures.length - 1 : tracker - 1;});
                          playWordsAudio();
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.6,
                      child: Image.asset(pictures[tracker]),
                      width: 200
                  ),
                  Container(
                    height: screenHeight * 0.6,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button_reversed.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == pictures.length - 1)? 0 : tracker + 1;});
                          playWordsAudio();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(words[tracker][0],
                      style: textStyle(Colors.black, 30)
                  ),
                  Text(words[tracker][1],
                      style: textStyle(Colors.black, 30)
                  ),
                  Text(words[tracker][2],
                      style: textStyle(Colors.black, 30)
                  )
                ],
              )
            ]
        )
    );


  }

  playSentenceAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(sentenceAudio);
  }

  playWordsAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(wordsAudio[tracker]);
  }
}
