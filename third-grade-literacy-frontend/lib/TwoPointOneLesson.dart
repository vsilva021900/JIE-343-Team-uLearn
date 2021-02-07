import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: TwoPointOneLesson()
  ));
}
class TwoPointOneLesson extends StatefulWidget {
  @override
  TwoPointOne createState() => TwoPointOne();
}
class TwoPointOne extends State<TwoPointOneLesson> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  var pictures = [Image.asset('assets/dropbox/sectionTwo/TwoPointOne/helps.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointOne/jumps.jpg'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointOne/kicks.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointOne/sings.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointOne/sleeps.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointOne/talks.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointOne/thinks.png'),
    Image.asset('assets/dropbox/sectionTwo/TwoPointOne/works.png')];
  var words = [['help', 'helps'], ['jump', 'jumps'],
    ['kick', 'kicks'], ['sing', 'sings'], ['sleep', 'sleeps'],
    ['talk', 'talks'], ['think', 'thinks'], ['work', 'works']];
  var music = ["help_helps.mp3",
    "jump_jumps.mp3",
    "kick_kicks.mp3",
    "sing_sings.mp3",
    "sleep_sleeps.mp3",
    "talk_talks.mp3",
    "think_thinks.mp3",
    "work_works.mp3"
  ];
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
                      Navigator.pop(context);
                    },
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/placeholder_home_button.png'),
                    onPressed: () {},
                  )
              ),
              Spacer(flex: 5),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {}
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        audioCache.play(music[tracker]);
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
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
                  Text('For third person singular action words,',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('to say someone or something does something, ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('most base words just add ',
                        style: textStyle(Colors.black, screenWidth / 24)
                    ),
                    Text('s',
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
