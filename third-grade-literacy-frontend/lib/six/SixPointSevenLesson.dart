import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/six/ScoreMenuSix.dart';
import 'package:hearatale_literacy_app/six/quiz/QuizSixPointSeven.dart';


class SixPointSevenLesson extends StatefulWidget {
  @override
  SixPointSeven createState() => SixPointSeven();
}

class SixPointSeven extends State<SixPointSevenLesson> {
  var pictures = [
    "assets/dropbox/SectionSix/SixPointSeven/boy's.png",
    "assets/dropbox/SectionSix/SixPointSeven/creature's.png",
    "assets/dropbox/SectionSix/SixPointSeven/dog's.png",
    "assets/dropbox/SectionSix/SixPointSeven/girl's.png",
    "assets/dropbox/SectionSix/SixPointSeven/neighbor's.png",
    "assets/dropbox/SectionSix/SixPointSeven/slide's.png",
    "assets/dropbox/SectionSix/SixPointSeven/wheel's.png",
    "assets/dropbox/SectionSix/SixPointSeven/woman's.png",
  ];
  var words = [
    ["boy is", "boy is", "the boy's very good"],
    ["creature is ", "creature's", "do you think the creature's dancing?"],
    ["dog is", "dog's", "the dog's making a friend"],
    ["girl is", "girl's", "the girl's trying to look like a rock star"],
    ["slide is", "slide's", "the slide's kind of wavy"],
    ["wheel is", "wheel's", "the front wheel's off"],
    ["woman is", "woman's", "the women's very careful"],
  ];
  var wordsAudio = [
    "dropbox/SectionSix/SixPointSeven/boyis_boy's_theboy'sverygood.mp3",
    "dropbox/SectionSix/SixPointSeven/creatureis_creature's_doyouthinkthecreature's.mp3",
    "dropbox/SectionSix/SixPointSeven/dogis_dosg's_thedog'smakingafriend.mp3",
    "dropbox/SectionSix/SixPointSeven/girlis_girl's_thegirl'stryingtolooklikearockstar.mp3",
    "dropbox/SectionSix/SixPointSeven/slideis_slide's_thisslide'skindofwavy.mp3",
    "dropbox/SectionSix/SixPointSeven/wheelis_wheel's_thefrontwheel'soff.mp3",
    "dropbox/SectionSix/SixPointSeven/womanis_woman's_thewoman'sverycareful.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String sentenceAudio = "dropbox/SectionSix/SixPointSeven/#6.7_Nounssometimesakeacontraction.mp3";

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
                                pageBuilder: (context, _, __) => QuizSixPointSeven(),
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
                  Text('Noun contractions with  ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('is ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('add ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('\' s ',
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