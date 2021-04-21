import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/ten/quiz/QuizTenTwo.dart';
import 'package:hearatale_literacy_app/ten/ScoreMenuTen.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/Rewards.dart';
import 'package:hearatale_literacy_app/PiggyBank.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: TenTwoLesson()
  ));
}
class TenTwoLesson extends StatefulWidget {
  @override
  TenTwo createState() => TenTwo();
}
class TenTwo extends State<TenTwoLesson> {
  var pictures = [Image.asset('assets/dropbox/SectionTen/1_2_father.png'),
    Image.asset('assets/dropbox/SectionTen/2_2_mother.png'),
    Image.asset('assets/dropbox/SectionTen/3_2_teacher.png'),
    Image.asset('assets/dropbox/SectionTen/4_2_football.png'),
    Image.asset('assets/dropbox/SectionTen/5_2_baboon.png'),
    Image.asset('assets/dropbox/SectionTen/6_2_robot.png'),
    Image.asset('assets/dropbox/SectionTen/7_2_giraffe.png'),
    Image.asset('assets/dropbox/SectionTen/8_2_spyglass.png'),
    Image.asset('assets/dropbox/SectionTen/9_2_parrot.png'),
    Image.asset('assets/dropbox/SectionTen/10_2_firetruck.png'),
    Image.asset('assets/dropbox/SectionTen/11_2_poodle.png'),
    Image.asset('assets/dropbox/SectionTen/12_2_doctor.png'),
    Image.asset('assets/dropbox/SectionTen/13_2_apple.png'),
    Image.asset('assets/dropbox/SectionTen/14_2_taco.png'),
    Image.asset('assets/dropbox/SectionTen/15_2_wagon.png'),
    Image.asset('assets/dropbox/SectionTen/16_2_tiger.png'),
    Image.asset('assets/dropbox/SectionTen/17_2_spider.png')];
  var words = [['father', 'fa-ther'], ['mother', 'mo-ther'],
    ['teacher', 'tea-cher'], ['football', 'foot-ball'], ['baboon', 'ba-boon'],
    ['robot', 'ro-bot'], ['giraffe', 'gi-raffe'], ['spyglass', 'spy-glass'],
    ['parrot	', 'par-rot	'], ['firetruck', 'fire-truck'], ['poodle', 'poo-dle'],
    ['doctor', 'doc-tor'], ['apple ', 'ap-ple '], ['taco', 'ta-co'],
    ['wagon', 'wa-gon'], ['tiger', 'ti-ger'], ['spider', 'spi-der']];
  var music = ['dropbox/SectionTen/1_2_father.mp3',
    'dropbox/SectionTen/2_2_mother.mp3',
    'dropbox/SectionTen/3_2_teacher.mp3',
    'dropbox/SectionTen/4_2_football.mp3',
    'dropbox/SectionTen/5_2_baboon.mp3',
    'dropbox/SectionTen/6_2_robot.mp3',
    'dropbox/SectionTen/7_2_giraffe.mp3',
    'dropbox/SectionTen/8_2_spyglass.mp3',
    'dropbox/SectionTen/9_2_parrot.mp3',
    'dropbox/SectionTen/10_2_firetruck.mp3',
    'dropbox/SectionTen/11_2_poodle.mp3',
    'dropbox/SectionTen/12_2_doctor.mp3',
    'dropbox/SectionTen/13_2_apple.mp3',
    'dropbox/SectionTen/14_2_taco.mp3',
    'dropbox/SectionTen/15_2_wagon.mp3',
    'dropbox/SectionTen/16_2_tiger.mp3',
    'dropbox/SectionTen/17_2_spider.mp3'];
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
                                pageBuilder: (context, _, __) => QuizTenTwo(),
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
                      Text(words[tracker][0], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker][1], style: textStyle(Colors.black, 30))
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
