import 'package:flutter/material.dart';
import 'ScoreMenuEight.dart';
import 'quiz/QuizEightPointEight.dart';
import '../helper.dart';


class EightPointEightLesson extends StatefulWidget {
  @override
  EightPointEight createState() => EightPointEight();
}

class EightPointEight extends State<EightPointEightLesson> {
  var pictures = [
    "assets/dropbox/SectionEight/EightPointEight/overaged.png",
    "assets/dropbox/SectionEight/EightPointEight/overcook.png",
    "assets/dropbox/SectionEight/EightPointEight/overdo.png",
    "assets/dropbox/SectionEight/EightPointEight/overfill.png",
    "assets/dropbox/SectionEight/EightPointEight/overflow.png",
    "assets/dropbox/SectionEight/EightPointEight/overgrow.png",
  ];
  var words = [
    ["over", "aged", "overaged"],
    ["over", "cook", "overcook"],
    ["over", "do", "overdo"],
    ["over", "fill", "overfill"],
    ["over", "flow", "overflow"],
    ["over", "grow", "overgrow"],
  ];
  var wordsAudio = [
    "dropbox/SectionEight/EightPointEight/over_aged_overaged.mp3",
    "dropbox/SectionEight/EightPointEight/over_cook_overcook.mp3",
    "dropbox/SectionEight/EightPointEight/over_do_overdo.mp3",
    "dropbox/SectionEight/EightPointEight/over_fill_overfill.mp3",
    "dropbox/SectionEight/EightPointEight/over_flow_overflow.mp3",
    "dropbox/SectionEight/EightPointEight/over_grow_overgrow.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  String sentenceAudio = "dropbox/SectionEight/EightPointEight/#8.8_theprefixOVERmeansTooMuch.mp3";

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
                                pageBuilder: (context, _, __) => QuizEightPointEight(),
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
                  Text('over ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('means ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('too much ',
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
