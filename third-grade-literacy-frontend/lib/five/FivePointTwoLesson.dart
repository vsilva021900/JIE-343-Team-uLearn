import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/five/quiz/QuizFivePointTwo.dart';
import 'package:hearatale_literacy_app/five/ScoreMenuFive.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: FivePointTwoLesson()
  ));
}
class FivePointTwoLesson extends StatefulWidget {
  @override
  FivePointTwo createState() => FivePointTwo();
}
class FivePointTwo extends State<FivePointTwoLesson> {
  var pictures = [Image.asset("assets/dropbox/sectionFive/FivePointTwo/boots'_tongues.png"), Image.asset("assets/dropbox/sectionFive/FivePointTwo/dogs'_leashes.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointTwo/dresses'_sleeves.png"), Image.asset("assets/dropbox/sectionFive/FivePointTwo/elves'_caps.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointTwo/fireflies'_tails.png"), Image.asset("assets/dropbox/sectionFive/FivePointTwo/flowers'_leaves.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointTwo/foxes'_noses.png"), Image.asset("assets/dropbox/sectionFive/FivePointTwo/peaches'_stems.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointTwo/workers'_tools.png")
  ];
  var words = ["the boots' tongues", "the dogs' leashes",
    "the dresses' sleeves", "the elves' caps", "the fireflies' tails",
    "the flowers' leaves", "the foxes' noses", "the peaches' stems",
    "the workers' tools"
  ];
  var music = ["boots'_theboots'tongues.mp3", "dogs'_thedogs'leashes.mp3",
    "dresses'_thedresses'_sleeves.mp3", "elves'_theelves'caps.mp3", "fireflies'_thefireflies'tails.mp3",
    "flowers'_theflowers'leaves.mp3", "foxes'_thefoxes'noses.mp3", "peaches'_thepeaches'stems.mp3",
    "workers'_theworkers'_tools.mp3"
  ];
  int tracker = 0;
  bool marker = true;
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String questionAudio = "#5.2_whenSatthenddon'taddSjustapostrophe.mp3";
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (marker) {
      playAudio();
    }
    marker = false;
    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
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
                                pageBuilder: (context, _, __) => QuizFivePointTwo(),
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
                  // can probably simplify with RichText
                  Text('When more than one person or thing possesses',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('or has something and there is already an s at',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('the end, don’t add an extra s, just add the ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('‘',
                      style: textStyle(Colors.red, screenWidth / 24)
                  ),
                  Text('.',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: screenHeight * 0.5,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == 0)? pictures.length - 1 : tracker - 1;});
                          playAudio2();
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.5,
                      child: pictures[tracker],
                      width: 200
                  ),
                  Container(
                    height: screenHeight * 0.5,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button_reversed.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == pictures.length - 1)? 0 : tracker + 1;});
                          playAudio2();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child:
                      Text(words[tracker], style: textStyle(Colors.black, 30))
                  )
                ],
              )
            ]
        )
    );
  }
  playAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(questionAudio);
  }
  playAudio2() async {
    stopAudio();
    audioPlayer = await audioCache.play(music[tracker]);
  }
  stopAudio() {
    audioPlayer.stop();
  }
  double screenHeight, screenWidth;
  TextStyle textStyle(Color col, double size) {
    return TextStyle(
      color: col,
      fontFamily: 'Comic',
      fontSize: size,
    );
  }
}