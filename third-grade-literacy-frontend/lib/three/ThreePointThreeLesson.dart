import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/three/quiz/QuizThreePointThree.dart';
import 'package:hearatale_literacy_app/three/ScoreMenuThree.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: ThreePointThreeLesson()
  ));
}
class ThreePointThreeLesson extends StatefulWidget {
  @override
  ThreePointThree createState() => ThreePointThree();
}
class ThreePointThree extends State<ThreePointThreeLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionThree/ThreePointThree/1_4_cranky-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/2_4_friendly-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/3_4_happy-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/4_4_icy-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/5_4_pretty-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/6_4_silly-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/7_4_sneaky_er_est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointThree/8_4_sorry-er-est.png')];
  var words = [['cranky', 'crankier', 'crankiest'], ['friendly', 'friendlier', 'friendliest'],
    ['happy', 'happier', 'happiest'], ['icy', 'icier', 'iciest'],
    ['pretty', 'prettier', 'prettiest'], ['silly', 'sillier', 'silliest'],
    ['sneaky', 'sneakier', 'sneakiest'], ['sorry', 'sorrier', 'sorriest']];
  var music = ["cranky.mp3",
    "friendly.mp3",
    "happy.mp3",
    "icy.mp3",
    "pretty.mp3",
    "silly.mp3",
    "sneaky.mp3",
    "sorry.mp3"];
  int tracker = 0;
  bool marker = true;
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String questionAudio = '#3.3_changeYtoIandaddERorEST.mp3';
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
                                pageBuilder: (context, _, __) => QuizThreePointThree(),
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
                               pageBuilder: (context, _, __) => ScoreThree(),
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
                  Text('When comparing things, words that end in a',
                      style: textStyle(Colors.black, screenWidth / 23)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('consonant and y change the y to i and add ',
                      style: textStyle(Colors.black, screenWidth / 23)
                  ),
                  Text('er ',
                      style: textStyle(Colors.red, screenWidth / 23)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('or ',
                      style: textStyle(Colors.black, screenWidth / 23)
                  ),
                  Text('est',
                      style: textStyle(Colors.red, screenWidth / 23)
                  ),
                  Text('.',
                      style: textStyle(Colors.black, screenWidth / 23)
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
                      Text(words[tracker][0], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker][1], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker][2], style: textStyle(Colors.black, 30))
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
