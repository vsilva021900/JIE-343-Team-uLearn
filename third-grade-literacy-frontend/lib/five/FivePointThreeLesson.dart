import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/five/quiz/QuizFivePointThree.dart';
import 'package:hearatale_literacy_app/five/ScoreMenuFive.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';



void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: FivePointThreeLesson()
  ));
}
class FivePointThreeLesson extends StatefulWidget {
  @override
  FivePointThree createState() => FivePointThree();
}
class FivePointThree extends State<FivePointThreeLesson> {
  var pictures = [Image.asset("assets/dropbox/sectionFive/FivePointThree/children's_teacher.png"), Image.asset("assets/dropbox/sectionFive/FivePointThree/feet's_big_toes.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointThree/geese's_beaks.png"), Image.asset("assets/dropbox/sectionFive/FivePointThree/men's_hands.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointThree/mice's_tails.png"), Image.asset("assets/dropbox/sectionFive/FivePointThree/people's_hands.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointThree/teeth's_color.png"), Image.asset("assets/dropbox/sectionFive/FivePointThree/women's_faces.png")
  ];
  var words = ["the children's teacher", "the feet's big toes",
    "the geese's beaks", "the men's hands", "the mice's tails",
    "the people's hands", "the teeth's color", "the women's faces"
  ];
  var music = ["children's_thechildren'steacher.mp3", "feet's_thefeet'sbigtoes.mp3",
    "geese's_thegesse'sbeaks.mp3", "men's_themen'shands.mp3", "mice's_themice'stails.mp3",
    "people's_thepeople'shands.mp3", "teeth's_theteeth'scolor.mp3", "women's_thewomen'sfaces.mp3"
  ];
  int tracker = 0;
  bool marker = true;
  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String questionAudio = '#5.3_Intro_Irregular_Plural_Possessives.mp3';
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
                                pageBuilder: (context, _, __) => QuizFivePointThree(),
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
                  Text('Some plurals don’t follow the rules - to show',
                      style: textStyle(Colors.black, screenWidth / 25)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('these plural words are possessive, that they',
                      style: textStyle(Colors.black, screenWidth / 25)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('have something, you need to remember to add ',
                      style: textStyle(Colors.black, screenWidth / 25)
                  ),
                  Text('’s',
                      style: textStyle(Colors.red, screenWidth / 25)
                  ),
                  Text('.',
                      style: textStyle(Colors.black, screenWidth / 25)
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