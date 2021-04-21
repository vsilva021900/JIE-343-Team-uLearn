import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/ten/quiz/QuizTenOne.dart';
import 'package:hearatale_literacy_app/ten/ScoreMenuTen.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/Rewards.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: TenOneLesson()
  ));
}
class TenOneLesson extends StatefulWidget {
  @override
  TenOne createState() => TenOne();
}
class TenOne extends State<TenOneLesson> {
  var pictures = [Image.asset('assets/dropbox/SectionTen/1_1_boy.png'),
    Image.asset('assets/dropbox/SectionTen/2_1_girl.png'),
    Image.asset('assets/dropbox/SectionTen/3_1_kid.png'),
    Image.asset('assets/dropbox/SectionTen/4_1_bat.png'),
    Image.asset('assets/dropbox/SectionTen/5_1_chimp.png'),
    Image.asset('assets/dropbox/SectionTen/6_1_doll.png'),
    Image.asset('assets/dropbox/SectionTen/7_1_elk.png'),
    Image.asset('assets/dropbox/SectionTen/8_1_eye.png'),
    Image.asset('assets/dropbox/SectionTen/9_1_hawk.png'),
    Image.asset('assets/dropbox/SectionTen/10_1_jeep.png'),
    Image.asset('assets/dropbox/SectionTen/11_1_mutt.png'),
    Image.asset('assets/dropbox/SectionTen/12_1_nurse.png'),
    Image.asset('assets/dropbox/SectionTen/13_1_plum.png'),
    Image.asset('assets/dropbox/SectionTen/14_1_soup.png'),
    Image.asset('assets/dropbox/SectionTen/15_1_trike.png'),
    Image.asset('assets/dropbox/SectionTen/16_1_wolf.png'),
    Image.asset('assets/dropbox/SectionTen/17_1_wasp.png')];
  var words = ['boy', 'girl', 'kid', 'bat', 'chimp', 'doll', 'elk', 'eye', 'hawk',
    'jeep', 'mutt', 'nurse', 'plum', 'soup', 'trike', 'wolf', 'wasp'];
  var music = ['dropbox/SectionTen/1_1_boy.mp3',
    'dropbox/SectionTen/2_1_girl.mp3',
    'dropbox/SectionTen/3_1_kid.mp3',
    'dropbox/SectionTen/4_1_bat.mp3',
    'dropbox/SectionTen/5_1_chimp.mp3',
    'dropbox/SectionTen/6_1_doll.mp3',
    'dropbox/SectionTen/7_1_elk.mp3',
    'dropbox/SectionTen/8_1_eye.mp3',
    'dropbox/SectionTen/9_1_hawk.mp3',
    'dropbox/SectionTen/10_1_jeep.mp3',
    'dropbox/SectionTen/11_1_mutt.mp3',
    'dropbox/SectionTen/12_1_nurse.mp3',
    'dropbox/SectionTen/13_1_plum.mp3',
    'dropbox/SectionTen/14_1_soup.mp3',
    'dropbox/SectionTen/15_1_trike.mp3',
    'dropbox/SectionTen/16_1_wolf.mp3',
    'dropbox/SectionTen/17_1_wasp.mp3'];
  int tracker = 0;
  bool marker = true;

  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String questionAudio = 'dropbox/SectionTen/#10_Syllables_Intro.mp3';
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
                                pageBuilder: (context, _, __) => QuizTenOne(),
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
                              pageBuilder: (context, _, __) => ScoreTen(),
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
                  Text('Syllables are different sound parts that go together like',
                      style: textStyle(Colors.black, screenWidth / 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('puzzle pieces to make a word. Every syllable has one or',
                      style: textStyle(Colors.black, screenWidth / 30)
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('more vowels, and usually has one or more consonants.',
                        style: textStyle(Colors.black, screenWidth / 30)
                    ),
                  ]
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
                  ),
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
