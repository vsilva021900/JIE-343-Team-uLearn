import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

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
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
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
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
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

  Widget sideBar(BuildContext context) {
    return Container(
        color: const Color(0xffc4e8e6),
        child: Column(
            children: <Widget>[
              Material(
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_back_button.png'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              ),
              Material(
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_home_button.png'),
                    onPressed: () {},
                  )
              ),
              Spacer(flex: 5),
              Material(
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {}
                  )
              ),
              Material(
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_piggy_button.png'),
                      onPressed: () {}
                  )
              ),
            ]
        )
    );
  }

// same as above except include replay button for audio files
// use for lesson pages
  Widget sideBarWithReplay(BuildContext context) {
    return Container(
        color: const Color(0xffc4e8e6),
        child: Column(
            children: <Widget>[
              Material(
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_back_button.png'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
              ),
              Material(
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_home_button.png'),
                    onPressed: () {},
                  )
              ),
              Spacer(flex: 5),
              Material(
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {}
                  )
              ),
              Material(
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        audioCache.play(music[tracker]);
                      }
                  )
              ),
              Material(
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_piggy_button.png'),
                      onPressed: () {}
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
                  Text('For third person singular action words, base',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('words that end with y change the y to ',
                      style: textStyle(Colors.black, 30)
                  ),
                  Text('i ',
                      style: textStyle(Colors.red, 30)
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('and add ',
                        style: textStyle(Colors.black, 30)
                    ),
                    Text('es',
                        style: textStyle(Colors.red, 30)
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
                          audioCache.play(music[tracker]);
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
                          audioCache.play(music[tracker]);
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

  double screenHeight, screenWidth;
  TextStyle textStyle(Color col, double size) {
    return TextStyle(
      color: col,
      fontFamily: 'Comic',
      fontSize: size,
    );
  }
}
