import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/two/quiz/QuizTwoPointTwo.dart';
import 'package:hearatale_literacy_app/two/ScoreMenuTwo.dart';
import '../helper.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: TwoPointTwoLesson()
  ));
}
class TwoPointTwoLesson extends StatefulWidget {
  @override
  TwoPointTwo createState() => TwoPointTwo();
}
class TwoPointTwo extends State<TwoPointTwoLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionTwo/TwoPointTwo/bully.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointTwo/carry.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointTwo/cry.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointTwo/dirty.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointTwo/flies.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointTwo/spy.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointTwo/try.png')];
  var words = [['bully', 'bullies'], ['carry', 'carries'],
    ['cry', 'cries'], ['dirty', 'dirties'], ['fly', 'flies'],
    ['spy', 'spies'], ['try', 'tries']];
  var music = ["bully_bullies.mp3",
    "carry_carries.mp3",
    "cry_cries.mp3",
    "dirty_dirties.mp3",
    "fly_flies.mp3",
    "spy_spies.mp3",
    "try_tries.mp3"];
  int tracker = 0;
  bool marker = true;
  String questionAudio = '#2.2_Intro_basewordsendYchangetoIaddES.mp3';
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
                                pageBuilder: (context, _, __) => QuizTwoPointTwo(),
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
                              pageBuilder: (context, _, __) => ScoreTwo(),
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
                  Text('For third person singular action words,',
                      style: textStyle(Colors.black, screenWidth / 23)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('base words that end with y change the y to ',
                      style: textStyle(Colors.black, screenWidth / 23)
                  ),
                  Text('i ',
                      style: textStyle(Colors.red, screenWidth / 23)
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('and add ',
                        style: textStyle(Colors.black, screenWidth / 23)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 23)
                    ),
                    Text('.',
                        style: textStyle(Colors.black, 30)
                    )
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
}
