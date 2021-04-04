import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/ten/quiz/QuizTenFour.dart';
import 'package:hearatale_literacy_app/ten/ScoreMenuTen.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: TenFourLesson()
  ));
}
class TenFourLesson extends StatefulWidget {
  @override
  TenFour createState() => TenFour();
}
class TenFour extends State<TenFourLesson> {
  var pictures = [Image.asset('assets/dropbox/SectionTen/1_4_great-grandfather.png'),
    Image.asset('assets/dropbox/SectionTen/2_4_great-grandmother.png'),
    Image.asset('assets/dropbox/SectionTen/3_4_custodian.png'),
    Image.asset('assets/dropbox/SectionTen/4_4_aerialist.png'),
    Image.asset('assets/dropbox/SectionTen/5_4_orangutan.png'),
    Image.asset('assets/dropbox/SectionTen/6_4_marionette.png'),
    Image.asset('assets/dropbox/SectionTen/7_4_rhinoceros.png'),
    Image.asset('assets/dropbox/SectionTen/8_4_binoculars.png'),
    Image.asset('assets/dropbox/SectionTen/9_4_oystercatcher.png'),
    Image.asset('assets/dropbox/SectionTen/10_4_convertible.png'),
    Image.asset('assets/dropbox/SectionTen/11_4_weimaraner.png'),
    Image.asset('assets/dropbox/SectionTen/12_4_psychologist.png'),
    Image.asset('assets/dropbox/SectionTen/13_4_watermelon.png'),
    Image.asset('assets/dropbox/SectionTen/14_4_macaroni.png'),
    Image.asset('assets/dropbox/SectionTen/15_4_unicycle.png'),
    Image.asset('assets/dropbox/SectionTen/16_4_alligator.png'),
    Image.asset('assets/dropbox/SectionTen/17_4_caterpillar.png')];
  var words = [['great-grandfather', 'great-grand-fa-ther'], ['great-grandmother', 'great-grand-mo-ther'],
    ['custodian', 'cus-to-di-an'], ['aerialist', 'aer-i-al-ist'], ['orangutan', 'o-rang-u-tan'],
    ['marionette', 'ma-ri-on-ette'], ['rhinoceros', 'rhi-no-cer-os'], ['binoculars', 'bi-no-cu-lars'],
    ['oystercatcher', 'oys-ter-cat-cher'], ['convertible', 'con-ver-ti-ble'], ['weimaraner', 'wei-ma-ran-er'],
    ['psychologist', 'psy-cho-lo-gist'], ['watermelon', 'wa-ter-me-lon'], ['macaroni', 'mac-a-ro-ni'],
    ['unicycle', 'u-ni-cy-cle'], ['alligator', 'al-li-ga-tor'], ['caterpillar', 'ca-ter-pil-lar']];
  var music = ['dropbox/SectionTen/1_4_great-grandfather.mp3',
    'dropbox/SectionTen/2_4_great-grandmother.mp3',
    'dropbox/SectionTen/3_4_custodian.mp3',
    'dropbox/SectionTen/4_4_aerialist.mp3',
    'dropbox/SectionTen/5_4_orangutan.mp3',
    'dropbox/SectionTen/6_4_marionette.mp3',
    'dropbox/SectionTen/7_4_rhinoceros.mp3',
    'dropbox/SectionTen/8_4_binoculars.mp3',
    'dropbox/SectionTen/9_4_oystercatcher.mp3',
    'dropbox/SectionTen/10_4_convertible.mp3',
    'dropbox/SectionTen/11_4_weimaraner.mp3',
    'dropbox/SectionTen/12_4_psychologist.mp3',
    'dropbox/SectionTen/13_4_watermelon.mp3',
    'dropbox/SectionTen/14_4_macaroni.mp3',
    'dropbox/SectionTen/15_4_unicycle.mp3',
    'dropbox/SectionTen/16_4_alligator.mp3',
    'dropbox/SectionTen/17_4_caterpillar.mp3'];
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
                                pageBuilder: (context, _, __) => QuizTenFour(),
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
