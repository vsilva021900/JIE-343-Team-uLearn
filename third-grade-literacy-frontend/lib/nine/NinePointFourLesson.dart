import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/nine/ScoreMenuNine.dart';
import 'package:hearatale_literacy_app/nine/quiz/QuizNinePointFour.dart';


class NinePointFourLesson extends StatefulWidget {
  @override
  NinePointFour createState() => NinePointFour();
}

class NinePointFour extends State<NinePointFourLesson> {
  var pictures = [
    "assets/dropbox/SectionNine/NinePointFour/bendable.png",
    "assets/dropbox/SectionNine/NinePointFour/breakable.png",
    "assets/dropbox/SectionNine/NinePointFour/enjoyable.png",
    "assets/dropbox/SectionNine/NinePointFour/fixable.png",
    "assets/dropbox/SectionNine/NinePointFour/flyable.png",
    "assets/dropbox/SectionNine/NinePointFour/lovable.png",
    "assets/dropbox/SectionNine/NinePointFour/believable.png",
    "assets/dropbox/SectionNine/NinePointFour/usable.png"
  ];
  var words = [
    ["bend", "able", "bendable"],
    ["break", "able", "breakable"],
    ["enjoy", "able", "enjoyable"],
    ["fix", "able", "fixable"],
    ["fly", "able", "flyable"],
    ["love", "able", "lovable"],
    ["believe", "able", "believable"],
    ["use", "able", "usable"]
  ];
  var wordsAudio = [
    "dropbox/SectionNine/NinePointFour/bend_able_bendable.mp3",
    "dropbox/SectionNine/NinePointFour/break_able_breakable.mp3",
    "dropbox/SectionNine/NinePointFour/enjoy_able_enjoyable.mp3",
    "dropbox/SectionNine/NinePointFour/fix_able_fixable.mp3",
    "dropbox/SectionNine/NinePointFour/fly_able_flyable.mp3",
    "dropbox/SectionNine/NinePointFour/love_able_lovable.mp3",
    "dropbox/SectionNine/NinePointFour/believe_able_believable.mp3",
    "dropbox/SectionNine/NinePointFour/use_able_usable.mp3"
  ];

  int tracker = 0;
  bool marker = true;

  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String sentenceAudio = "dropbox/SectionNine/NinePointFour/#9.4_suffixABLEmeansCanBe_YmaychangetoI.mp3";

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
                                pageBuilder: (context, _, __) => QuizNinePointFour(),
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
                  Text('able ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('means ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('can be ',
                      style: textStyle(Colors.red, screenWidth / 24)
                  ),
                  Text('or ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('able to be',
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