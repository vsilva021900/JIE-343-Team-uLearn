import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/two/quiz/QuizTwoPointThree.dart';
import 'package:hearatale_literacy_app/two/ScoreMenuTwo.dart';
import '../helper.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: TwoPointThreeLesson()
  ));
}
class TwoPointThreeLesson extends StatefulWidget {
  @override
  TwoPointThree createState() => TwoPointThree();
}
class TwoPointThree extends State<TwoPointThreeLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionTwo/TwoPointThree/catches.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointThree/hitches.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointThree/scratches.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointThree/teaches.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointThree/touch.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointThree/watch.png')];
  var words = [['catch', 'catches'], ['hitch', 'hitches'],
    ['scratch', 'scratches'], ['teach', 'teaches'], ['touch', 'touches'],
    ['watch', 'watches']];
  var music = ["catch_catches.mp3",
    "hitch_hitches.mp3",
    "scratch_scratches.mp3",
    "teach_teaches.mp3",
    "touch_touches.mp3",
    "watch_watches.mp3"];
  int tracker = 0;
  bool marker = true;

  String questionAudio = '#2.3_basewordsthatendCHaddES.mp3';
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
                            pageBuilder: (context, _, __) => QuizTwoPointThree(),
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
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('to say someone or something does something,',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('base words that end with ch add ',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, screenWidth / 24)
                    ),
                    Text('.',
                        style: textStyle(Colors.black, screenWidth / 24)
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
}
