import 'dart:async';
//import 'dart:html';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: FourPointOneLesson()
  ));
}
class FourPointOneLesson extends StatefulWidget {
  @override
  FourPointOne createState() => FourPointOne();
}
class FourPointOne extends State<FourPointOneLesson> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  var pictures = [[Image.asset('assets/dropbox/sectionFour/FourPointOne/bubble.png'), Image.asset('assets/dropbox/sectionFour/FourPointOne/bubbles.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointOne/cookie.png'), Image.asset('assets/dropbox/sectionFour/FourPointOne/cookies.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointOne/creature.png'), Image.asset('assets/dropbox/sectionFour/FourPointOne/creatures.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointOne/frog.png'), Image.asset('assets/dropbox/sectionFour/FourPointOne/frogs.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointOne/giraffe.png'), Image.asset('assets/dropbox/sectionFour/FourPointOne/giraffes.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointOne/puddle.png'), Image.asset('assets/dropbox/sectionFour/FourPointOne/puddles.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointOne/stripe.png'), Image.asset('assets/dropbox/sectionFour/FourPointOne/stripes.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointOne/vehicle.png'), Image.asset('assets/dropbox/sectionFour/FourPointOne/vehicles.png')]
  ];
  var words = [['bubble', 'bubbles'],
    ['cookie', 'cookies'],
    ['creature', 'creatures'],
    ['frog', 'frogs'],
    ['giraffe', 'giraffes'],
    ['puddle', 'puddles'],
    ['stripe', 'stripes'],
    ['vehicles', 'vehicles']
  ];
  var music = [['bubble.mp3', 'bubbles.mp3'],
  ['cookie.mp3', 'cookies.mp3'],
  ['creature.mp3', 'creatures.mp3'],
  ['frog.mp3', 'frogs.mp3'],
  ['giraffe.mp3', 'giraffes.mp3'],
  ['puddle.mp3', 'puddles.mp3'],
  ['stripe.mp3', 'stripes.mp3'],
  ['vehicles.mp3', 'vehicles.mp3']
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
                  Text('Many base words just add ',
                      style: textStyle(Colors.black, 30)
                  ),
                  Text('s ',
                      style: textStyle(Colors.red, 30)
                  ),
                  Text('and make no other',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('change to turn the base word into a plural.',
                      style: textStyle(Colors.black, 30)
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