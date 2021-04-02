import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/six/ScoreMenuSix.dart';
import 'package:hearatale_literacy_app/six/quiz/QuizSixPointFour.dart';


class SixPointFourLesson extends StatefulWidget {
  @override
  SixPointFour createState() => SixPointFour();
}

class SixPointFour extends State<SixPointFourLesson> {
  var pictures = [
    "assets/dropbox/SectionSix/SixPointFour/he'd.png",
    "assets/dropbox/SectionSix/SixPointFour/I'd.png",
    "assets/dropbox/SectionSix/SixPointFour/she'd.png",
    "assets/dropbox/SectionSix/SixPointFour/they'd.png",
    "assets/dropbox/SectionSix/SixPointFour/we'd.png",
    "assets/dropbox/SectionSix/SixPointFour/you'd.png",
  ];
  var words = [
    ["he would", "he'd", "he'd work faster if he used legos"],
    ["I would", "I'd", "I'd love some!"],
    ["she would", "she'd", "she'd pick all three if she could"],
    ["they would", "they'd", "they'd better be careful not to get tangled up"],
    ["we would", "we'd", "we'd better keep our stingers aimed away from the beach"],
    ["you would", "you'd", "pick the place you'd like to go first"],
  ];
  var wordsAudio = [
    "dropbox/SectionSix/SixPointFour/1b_hewould_he'd_he'dworkfaster.mp3",
    "dropbox/SectionSix/SixPointFour/2b_Iwould_I'd_I'dlovesome.mp3",
    "dropbox/SectionSix/SixPointFour/3b_shewould_she'd_she'dpickleallthree.mp3",
    "dropbox/SectionSix/SixPointFour/4b_theywould_they'd_they'dbetterbe.mp3",
    "dropbox/SectionSix/SixPointFour/5b_wewould_we'd_we'dbetterkeep.mp3",
    "dropbox/SectionSix/SixPointFour/6b_youwould_you'd_you'dpicktheplace.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String sentenceAudio = "dropbox/SectionSix/SixPointFour/#6.4_tomakeacontractionwithWOULDjustadd.mp3";

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

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
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {
                        stopAudio();
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => QuizSixPointFour(),
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
                      }
                  )
              ),
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
                  Text('To make a contraction with ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('would ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('just add ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('\'d ',
                      style: textStyle(Colors.red, screenWidth / 24)
                  ),
                  Text('at the end of the pronoun ',
                      style: textStyle(Colors.black, screenWidth / 24)
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
                          setState(() {
                            tracker = (tracker == 0)
                                ? pictures.length - 1
                                : tracker - 1;
                          });
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
                        icon: Image.asset(
                            'assets/placeholder_back_button_reversed.png'),
                        onPressed: () {
                          setState(() {
                            tracker = (tracker == pictures.length - 1)
                                ? 0
                                : tracker + 1;
                          });
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

  stopAudio() {
    audioPlayer.stop();
  }
}

double screenHeight, screenWidth;
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}