import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/nine/ScoreMenuNine.dart';
import 'package:hearatale_literacy_app/nine/quiz/QuizNinePointFive.dart';


class NinePointFiveLesson extends StatefulWidget {
  @override
  NinePointFive createState() => NinePointFive();
}

class NinePointFive extends State<NinePointFiveLesson> {
  var pictures = [
    "assets/dropbox/SectionNine/NinePointFive/brighten.png",
    "assets/dropbox/SectionNine/NinePointFive/broken.png",
    "assets/dropbox/SectionNine/NinePointFive/hidden.png",
    "assets/dropbox/SectionNine/NinePointFive/loosen.png",
    "assets/dropbox/SectionNine/NinePointFive/strengthen.png",
    "assets/dropbox/SectionNine/NinePointFive/tighten.png"
  ];
  var words = [
    ["bright", "en", "brighten"],
    ["broke", "en", "broken"],
    ["hid", "d en", "hidden"],
    ["loose", "en", "loosen"],
    ["strength", "en", "strengthen"],
    ["tight", "en", "tighten"]
  ];
  var wordsAudio = [
    "dropbox/SectionNine/NinePointFive/bright_en_brighten.mp3",
    "dropbox/SectionNine/NinePointFive/broke_en_broken.mp3",
    "dropbox/SectionNine/NinePointFive/hid_den_hidden.mp3",
    "dropbox/SectionNine/NinePointFive/loose_en_loosen.mp3",
    "dropbox/SectionNine/NinePointFive/strength_en_strengthen.mp3",
    "dropbox/SectionNine/NinePointFive/tight_en_tighten.mp3"
  ];

  int tracker = 0;
  bool marker = true;

  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String sentenceAudio = "dropbox/SectionNine/NinePointFive/#9.5_suffixEN_Intro_3_parts.mp3";

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
                                pageBuilder: (context, _, __) => QuizNinePointFive(),
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
    double fontSize = screenWidth / 29;
    return Container(
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('The suffix ',
                      style: textStyle(Colors.black, fontSize)
                  ),
                  Text('en ',
                      style: textStyle(Colors.green, fontSize)
                  ),
                  Text('means ',
                      style: textStyle(Colors.black, fontSize)
                  ),
                  Text('made of ',
                      style: textStyle(Colors.red, fontSize)
                  ),
                  Text('or ',
                      style: textStyle(Colors.black, fontSize)
                  ),
                  Text('to make',
                      style: textStyle(Colors.red, fontSize)
                  ),
                  Text('. If the',
                      style: textStyle(Colors.black, fontSize)
                  ),
                ],
              ),
              Text('base words end with a short vowel sound and a',
                  style: textStyle(Colors.black, fontSize)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('constant, double the consonant before adding ',
                      style: textStyle(Colors.black, fontSize)
                  ),
                  Text('en',
                      style: textStyle(Colors.green, fontSize)
                  ),
                  Text('.',
                      style: textStyle(Colors.black, fontSize)
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