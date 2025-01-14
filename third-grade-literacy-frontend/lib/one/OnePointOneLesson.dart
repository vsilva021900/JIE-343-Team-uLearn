import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/one/quiz/QuizOnePointOne.dart';
import 'package:hearatale_literacy_app/one/ScoreMenuOne.dart';
import 'package:hearatale_literacy_app/helper.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: OnePointOneLesson()
  ));
}
class OnePointOneLesson extends StatefulWidget {
  @override
  OnePointOne createState() => OnePointOne();
}
class OnePointOne extends State<OnePointOneLesson> {
  var pictures = [Image.asset('assets/dropbox/sectionOne/OnePointOne/fix.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointOne/help.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointOne/jump.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointOne/own.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointOne/paint.png'),
    Image.asset('assets/dropbox/sectionOne/OnePointOne/talk.png')];
  var words = [['fix', 'fixed', 'fixing'],
    ['help', 'helped', "helping"],
    ['jump', 'jumped', "jumping"],
    ['own', 'owned', "owning"],
    ['paint', 'painted', "painting"],
    ['talk', 'talked', "talking"]];
  var music = ["fix_fixed_fixing.mp3",
    "help_helped_helping.mp3",
    "jump_jumped_jumping.mp3",
    "own_owned_owning.mp3",
    "paint_painted_painting.mp3",
    "talk_talked_talking.mp3"];

  int tracker = 0;
  bool marker = true;

  String questionAudio = '#1.1_manywordsjustaddEDorING.mp3';

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
                                pageBuilder: (context, _, __) => QuizOnePointOne(),
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
                              pageBuilder: (context, _, __) => ScoreOne(),
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
                  Text('Many action words just add ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('ed ',
                      style: textStyle(Colors.red, screenWidth / 24)
                  ),
                  Text('or ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('ing',
                      style: textStyle(Colors.red, screenWidth / 24)
                  ),
                  Text(' to the',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' base word without making any other changes.',
                      style: textStyle(Colors.black, screenWidth / 24)
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
                      child: pictures[tracker],
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
}
