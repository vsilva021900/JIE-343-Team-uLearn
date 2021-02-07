import 'dart:async';
//import 'dart:html';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: FourPointTwoLesson()
  ));
}
class FourPointTwoLesson extends StatefulWidget {
  @override
  FourPointTwo createState() => FourPointTwo();
}
class FourPointTwo extends State<FourPointTwoLesson> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  var pictures = [[Image.asset('assets/dropbox/sectionFour/FourPointTwo/bus.png'), Image.asset('assets/dropbox/sectionFour/FourPointTwo/buses.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointTwo/dress.png'), Image.asset('assets/dropbox/sectionFour/FourPointTwo/dresses.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointTwo/glass.png'), Image.asset('assets/dropbox/sectionFour/FourPointTwo/glasses.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointTwo/guess.png'), Image.asset('assets/dropbox/sectionFour/FourPointTwo/guesses.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointTwo/kiss.png'), Image.asset('assets/dropbox/sectionFour/FourPointTwo/kisses.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointTwo/walrus.png'), Image.asset('assets/dropbox/sectionFour/FourPointTwo/walruses.png')]
  ];
  var words = [['bus', 'buses'],
    ['dress', 'dresses'],
    ['glass', 'glasses'],
    ['guess', 'guesses'],
    ['kiss', 'kisses'],
    ['walrus', 'walruses']
  ];
  var music = [['bus.mp3', 'buses.mp3'],
    ['dress.mp3', 'dresses.mp3'],
    ['glass.mp3', 'glasses.mp3'],
    ['guess.mp3', 'guesses.mp3'],
    ['kiss.mp3', 'kisses.mp3'],
    ['walrus.mp3', 'walruses.mp3']
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
                        audioCache.play(music[tracker][0]);
                        audioCache.play(music[tracker][1]);
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

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

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
                          audioCache.play(music[tracker][0]);
                          audioCache.play(music[tracker][1]);
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
                          audioCache.play(music[tracker][0]);
                          audioCache.play(music[tracker][1]);
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