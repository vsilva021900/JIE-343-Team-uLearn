import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/main.dart';
import 'package:hearatale_literacy_app/ten/quiz/QuizTenAll.dart';
import 'package:hearatale_literacy_app/ten/ScoreMenuTen.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: TenAllLesson()
  ));
}
class TenAllLesson extends StatefulWidget {
  @override
  TenAll createState() => TenAll();
}
class TenAll extends State<TenAllLesson> {
  var pictures1 = [Image.asset('assets/dropbox/SectionTen/1_1_boy.png'),
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
  var pictures2 = [Image.asset('assets/dropbox/SectionTen/1_2_father.png'),
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
  var pictures3 = [Image.asset('assets/dropbox/SectionTen/1_3_grandfather.png'),
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
  var pictures4 = [Image.asset('assets/dropbox/SectionTen/1_4_great-grandfather.png'),
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
  var words1 = ['boy', 'girl', 'kid', 'bat', 'chimp', 'doll', 'elk', 'eye', 'hawk',
    'jeep', 'mutt', 'nurse', 'plum', 'soup', 'trike', 'wolf', 'wasp'];
  var words2 = [['father', 'fa-ther'], ['mother', 'mo-ther'],
    ['teacher', 'tea-cher'], ['football', 'foot-ball'], ['baboon', 'ba-boon'],
    ['robot', 'ro-bot'], ['giraffe', 'gi-raffe'], ['spyglass', 'spy-glass'],
    ['parrot	', 'par-rot	'], ['firetruck', 'fire-truck'], ['poodle', 'poo-dle'],
    ['doctor', 'doc-tor'], ['apple', 'ap-ple'], ['taco', 'ta-co'],
    ['wagon', 'wa-gon'], ['tiger', 'ti-ger'], ['spider', 'spi-der']];
  var words3 = [['grandfather', 'grand-fa-ther'], ['grandmother', 'grand-mo-ther'],
    ['principal', 'prin-ci-pal'], ['basketball', 'bas-ket-ball'], ['gorilla', 'go-ril-la'],
    ['teddybear', 'ted-dy-bear'], ['kangaroo', 'kan-ga-roo'], ['sunglasses', 'sun-glass-es'],
    ['cardinal', 'car-di-nal'], ['bulldozer', 'bull-do-zer'], ['dalmation', 'dal-ma-tion'],
    ['physician', 'phy-si-cian'], ['pineapple', 'pine-ap-ple'], ['hamburger', 'ham-bur-ger'],
    ['bicycle', 'bi-cy-cle'], ['rattlesnake', 'rat-tle-snake'], ['centipede', 'cen-ti-pede']];
  var words4 = [['great-grandfather', 'great-grand-fa-ther'], ['great-grandmother', 'great-grand-mo-ther'],
    ['custodian', 'cus-to-di-an'], ['aerialist', 'aer-i-al-ist'], ['orangutan', 'o-rang-u-tan'],
    ['marionette', 'ma-ri-on-ette'], ['rhinoceros', 'rhi-no-cer-os'], ['binoculars', 'bi-no-cu-lars'],
    ['oystercatcher', 'oys-ter-cat-cher'], ['convertible', 'con-ver-ti-ble'], ['weimaraner', 'wei-ma-ran-er'],
    ['psychologist', 'psy-cho-lo-gist'], ['watermelon', 'wa-ter-me-lon'], ['macaroni', 'mac-a-ro-ni'],
    ['unicycle', 'u-ni-cy-cle'], ['alligator', 'al-li-ga-tor'], ['caterpillar', 'ca-ter-pil-lar']];

  var music1 = ['dropbox/SectionTen/1_1_boy.mp3',
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

  var music2 = ['dropbox/SectionTen/1_2_father.mp3',
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

  var music3 = ['dropbox/SectionTen/1_3_grandfather.mp3',
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

  var music4 = ['dropbox/SectionTen/1_4_great-grandfather.mp3',
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

  var music5 = ['dropbox/SectionTen/Unit1.mp3',
    'dropbox/SectionTen/Unit2.mp3',
    'dropbox/SectionTen/Unit3.mp3',
    'dropbox/SectionTen/Unit4.mp3',
    'dropbox/SectionTen/Unit5.mp3',
    'dropbox/SectionTen/Unit6.mp3',
    'dropbox/SectionTen/Unit7.mp3',
    'dropbox/SectionTen/Unit8.mp3',
    'dropbox/SectionTen/Unit9.mp3',
    'dropbox/SectionTen/Unit10.mp3',
    'dropbox/SectionTen/Unit11.mp3',
    'dropbox/SectionTen/Unit12.mp3',
    'dropbox/SectionTen/Unit13.mp3',
    'dropbox/SectionTen/Unit14.mp3',
    'dropbox/SectionTen/Unit15.mp3',
    'dropbox/SectionTen/Unit16.mp3',
    'dropbox/SectionTen/Unit17.mp3'];
  int tracker = 0;
  bool marker = true;

  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String questionAudio = 'dropbox/SectionTen/StartAudio.mp3';
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
                                pageBuilder: (context, _, __) => QuizTenAll(),
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
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('puzzle pieces to make a word. Every syllable has one or',
                      style: textStyle(Colors.black, screenWidth / 35)
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('more vowels, and usually has one or more consonants.',
                        style: textStyle(Colors.black, screenWidth / 35)
                    ),
                  ]
              ),
              Container(
                  height: screenHeight / 40
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
                          setState(() { tracker = (tracker == 0)? pictures1.length - 1 : tracker - 1;});
                          playAudio6();
                        },
                      ),
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    playAudio2();
                                  },
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            height: screenHeight * 0.2,
                                            child: pictures1[tracker],
                                            width: 200
                                        ),
                                        Text(words1[tracker],
                                            style: textStyle(Colors.black, screenWidth / 35)
                                        ),
                                      ]
                                  ),
                              ),
                              Container(
                                  width: screenWidth / 40
                              ),
                              GestureDetector(
                                onTap: () {
                                  playAudio4();
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: screenHeight * 0.2,
                                          child: pictures3[tracker],
                                          width: 200
                                      ),
                                      Text(words3[tracker][0],
                                          style: textStyle(Colors.black, screenWidth / 35)
                                      ),
                                      Text(words3[tracker][1],
                                          style: textStyle(Colors.black, screenWidth / 35)
                                      ),
                                    ]
                                ),
                              ),
                            ]
                        ),
                        Container(
                            height: screenHeight / 40
                        ), //Spacer
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  playAudio3();
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: screenHeight * 0.2,
                                          child: pictures2[tracker],
                                          width: 200
                                      ),
                                      Text(words2[tracker][0],
                                          style: textStyle(Colors.black, screenWidth / 35)
                                      ),
                                      Text(words2[tracker][1],
                                          style: textStyle(Colors.black, screenWidth / 35)
                                      ),
                                    ]
                                ),
                              ),
                              Container(
                                  width: screenWidth / 30
                              ),
                              GestureDetector(
                                onTap: () {
                                  playAudio5();
                                },
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: screenHeight * 0.2,
                                          child: pictures4[tracker],
                                          width: 200
                                      ),
                                      Text(words4[tracker][0],
                                          style: textStyle(Colors.black, screenWidth / 35)
                                      ),
                                      Text(words4[tracker][1],
                                          style: textStyle(Colors.black, screenWidth / 35)
                                      ),
                                    ]
                                ),
                              ),
                            ]
                        ),
                      ]
                  ),
                  Container(
                    height: screenHeight * 0.5,
                    child: Transform.scale(
                      scale: 1,
                      child: IconButton(
                        icon: Image.asset('assets/placeholder_back_button_reversed.png'),
                        onPressed: () {
                          setState(() { tracker = (tracker == pictures1.length - 1)? 0 : tracker + 1;});
                          playAudio6();
                        },
                      ),
                    ),
                  )
                ],
              ),
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
    audioPlayer = await audioCache.play(music1[tracker]);
  }
  playAudio3() async {
    stopAudio();
    audioPlayer = await audioCache.play(music2[tracker]);
  }
  playAudio4() async {
    stopAudio();
    audioPlayer = await audioCache.play(music3[tracker]);
  }
  playAudio5() async {
    stopAudio();
    audioPlayer = await audioCache.play(music4[tracker]);
  }
  playAudio6() async {
    stopAudio();
    audioPlayer = await audioCache.play(music5[tracker]);
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
