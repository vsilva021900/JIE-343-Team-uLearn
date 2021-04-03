import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/ten/quiz/QuizTenThree.dart';
import 'package:hearatale_literacy_app/ten/ScoreMenuTen.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: TenThreeLesson()
  ));
}
class TenThreeLesson extends StatefulWidget {
  @override
  TenThree createState() => TenThree();
}
class TenThree extends State<TenThreeLesson> {
  var pictures = [Image.asset('assets/dropbox/SectionTen/1_3_grandfather.png'),
    Image.asset('assets/dropbox/SectionTen/2_3_grandmother.png'),
    Image.asset('assets/dropbox/SectionTen/3_3_principal.png'),
    Image.asset('assets/dropbox/SectionTen/4_3_basketball.png'),
    Image.asset('assets/dropbox/SectionTen/5_3_gorilla.png'),
    Image.asset('assets/dropbox/SectionTen/6_3_teddybear.png'),
    Image.asset('assets/dropbox/SectionTen/7_3_kangaroo.png'),
    Image.asset('assets/dropbox/SectionTen/8_3_sunglasses.png'),
    Image.asset('assets/dropbox/SectionTen/9_3_cardinal.png'),
    Image.asset('assets/dropbox/SectionTen/10_3_bulldozer.png'),
    Image.asset('assets/dropbox/SectionTen/11_3_dalmation.png'),
    Image.asset('assets/dropbox/SectionTen/12_3_physician.png'),
    Image.asset('assets/dropbox/SectionTen/13_3_pineapple.png'),
    Image.asset('assets/dropbox/SectionTen/14_3_hamburger.png'),
    Image.asset('assets/dropbox/SectionTen/15_3_bicycle.png'),
    Image.asset('assets/dropbox/SectionTen/16_3_rattlesnake.png'),
    Image.asset('assets/dropbox/SectionTen/17_3_centipede.png')];
  var words = [['grandfather	', 'grand-fa-ther	'], ['grandmother', 'grand-mo-ther'],
    ['principal', 'prin-ci-pal'], ['basketball', 'bas-ket-ball'], ['gorilla', 'go-ril-la'],
    ['teddybear', 'ted-dy-bear'], ['kangaroo', 'kan-ga-roo'], ['sunglasses', 'sun-glass-es'],
    ['cardinal', 'car-di-nal'], ['bulldozer', 'bull-do-zer'], ['dalmation', 'dal-ma-tion'],
    ['physician', 'phy-si-cian'], ['pineapple', 'pine-ap-ple'], ['hamburger', 'ham-bur-ger'],
    ['bicycle', 'bi-cy-cle'], ['rattlesnake', 'rat-tle-snake'], ['centipede', 'cen-ti-pede']];
  var music = ['dropbox/SectionTen/1_3_grandfather.mp3',
    'dropbox/SectionTen/2_3_grandmother.mp3',
    'dropbox/SectionTen/3_3_principal.mp3',
    'dropbox/SectionTen/4_3_basketball.mp3',
    'dropbox/SectionTen/5_3_gorilla.mp3',
    'dropbox/SectionTen/6_3_teddybear.mp3',
    'dropbox/SectionTen/7_3_kangaroo.mp3',
    'dropbox/SectionTen/8_3_sunglasses.mp3',
    'dropbox/SectionTen/9_3_cardinal.mp3',
    'dropbox/SectionTen/10_3_bulldozer.mp3',
    'dropbox/SectionTen/11_3_dalmation.mp3',
    'dropbox/SectionTen/12_3_physician.mp3',
    'dropbox/SectionTen/13_3_pineapple.mp3',
    'dropbox/SectionTen/14_3_hamburger.mp3',
    'dropbox/SectionTen/15_3_bicycle.mp3',
    'dropbox/SectionTen/16_3_rattlesnake.mp3',
    'dropbox/SectionTen/17_3_centipede.mp3'];
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
                                pageBuilder: (context, _, __) => QuizTenThree(),
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
