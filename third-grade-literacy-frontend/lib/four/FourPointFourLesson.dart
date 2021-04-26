import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/four/ScoreMenuFour.dart';
import 'package:hearatale_literacy_app/four/quiz/QuizFourPointFour.dart';
import 'package:hearatale_literacy_app/helper.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: FourPointFourLesson()
  ));
}
class FourPointFourLesson extends StatefulWidget {
  @override
  FourPointFour createState() => FourPointFour();
}
class FourPointFour extends State<FourPointFourLesson> {
  var pictures = [[Image.asset('assets/dropbox/sectionFour/FourPointFour/crutch.png'), Image.asset('assets/dropbox/sectionFour/FourPointFour/crutches.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointFour/itch.png'), Image.asset('assets/dropbox/sectionFour/FourPointFour/itches.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointFour/ostrich.png'), Image.asset('assets/dropbox/sectionFour/FourPointFour/ostriches.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointFour/peach.png'), Image.asset('assets/dropbox/sectionFour/FourPointFour/peaches.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointFour/scratch.png'), Image.asset('assets/dropbox/sectionFour/FourPointFour/scratches.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointFour/watch.png'), Image.asset('assets/dropbox/sectionFour/FourPointFour/watches.png')]
  ];
  var words = [['crutch', 'crutches'],
    ['itch', 'itches'],
    ['ostrich', 'ostriches'],
    ['peach', 'peaches'],
    ['scratch', 'scratches'],
    ['watch', 'watches']
  ];
  var music = ['crutch_crutches.mp3',
    'itch_itches.mp3',
    'ostrich_ostriches.mp3',
    'peach_peaches.mp3',
    'scratch_scratches.mp3',
    'watch_watches.mp3'
  ];
  int tracker = 0;
  bool marker = true;

  String questionAudio = '#4.4_wordsendCHaddES j.mp3';
  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

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
              backButton(context),
              homeButton(context),
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
                                pageBuilder: (context, _, __) => QuizFourPointFour(),
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
                              pageBuilder: (context, _, __) => ScoreFour(),
                              transitionDuration: Duration(seconds: 0)
                          )
                      );
                    },
                  )
              ),
              pinkPigButton(context)
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
                  Text('Base words that end with ch just add ',
                      style: textStyle(Colors.black, screenWidth / 26)
                  ),
                  Text('es ',
                      style: textStyle(Colors.red, screenWidth / 26)
                  ),
                  Text('and make',
                      style: textStyle(Colors.black, screenWidth / 26)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('no other change to turn the word into a plural.',
                      style: textStyle(Colors.black, screenWidth / 26)
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
                          playAudio2();
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.6,
                      child: pictures[tracker][0],
                      width: 200
                  ),
                  Container(
                      height: screenHeight * 0.6,
                      child: pictures[tracker][1],
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
}