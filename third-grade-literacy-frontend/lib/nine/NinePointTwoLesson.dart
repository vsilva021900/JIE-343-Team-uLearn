import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/nine/ScoreMenuNine.dart';
import 'package:hearatale_literacy_app/nine/quiz/QuizNinePointTwo.dart';
import 'package:hearatale_literacy_app/Rewards.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';

class NinePointTwoLesson extends StatefulWidget {
  @override
  NinePointTwo createState() => NinePointTwo();
}

class NinePointTwo extends State<NinePointTwoLesson> {
  var pictures = [
    "assets/dropbox/SectionNine/NinePointTwo/painful.png",
    "assets/dropbox/SectionNine/NinePointTwo/hopeful.png",
    "assets/dropbox/SectionNine/NinePointTwo/careful.png",
    "assets/dropbox/SectionNine/NinePointTwo/beautiful.png",
    "assets/dropbox/SectionNine/NinePointTwo/cheerful.png",
    "assets/dropbox/SectionNine/NinePointTwo/colorful.png",
    "assets/dropbox/SectionNine/NinePointTwo/dutiful.png",
    "assets/dropbox/SectionNine/NinePointTwo/merciful.png"
  ];
  var words = [
    ["pain", "ful", "painful"],
    ["hope", "ful", "hopeful"],
    ["care", "ful", "careful"],
    ["beauty", "ful", "beautiful"],
    ["cheer", "ful", "cheerful"],
    ["color", "ful", "colorful"],
    ["duty", "ful", "dutiful"],
    ["mercy", "ful", "merciful"]
  ];
  var wordsAudio = [
    "dropbox/SectionNine/NinePointTwo/pain_ful_painful.mp3",
    "dropbox/SectionNine/NinePointTwo/hope_ful_hopeful.mp3",
    "dropbox/SectionNine/NinePointTwo/care_ful_careful.mp3",
    "dropbox/SectionNine/NinePointTwo/beauty_ful_beautiful.mp3",
    "dropbox/SectionNine/NinePointTwo/cheer_ful_cheerful.mp3",
    "dropbox/SectionNine/NinePointTwo/color_ful_colorful.mp3",
    "dropbox/SectionNine/NinePointTwo/duty_ful_dutiful.mp3",
    "dropbox/SectionNine/NinePointTwo/mercy_ful_merciful.mp3"
  ];

  int tracker = 0;
  bool marker = true;

  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String sentenceAudio = "dropbox/SectionNine/NinePointTwo/#9.2_SuffixFULmeansFullOf_changeYtoI.mp3";

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
                                pageBuilder: (context, _, __) => QuizNinePointTwo(),
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
                              pageBuilder: (context, _, __) => ScoreNine(),
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
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // can probably simplify with RichText
                  Text('The suffix ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('ful ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('means ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('full of',
                      style: textStyle(Colors.red, screenWidth / 24)
                  ),
                  Text('.',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Text('',
                  style: textStyle(Colors.black, screenWidth / 24)
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