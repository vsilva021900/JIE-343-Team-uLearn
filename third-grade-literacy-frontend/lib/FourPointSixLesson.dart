import 'dart:async';
//import 'dart:html';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: FourPointSixLesson()
  ));
}
class FourPointSixLesson extends StatefulWidget {
  @override
  FourPointSix createState() => FourPointSix();
}
class FourPointSix extends State<FourPointSixLesson> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  var pictures = [[Image.asset('assets/dropbox/sectionFour/FourPointSix/baby.png'), Image.asset('assets/dropbox/sectionFour/FourPointSix/babies.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointSix/berry.png'), Image.asset('assets/dropbox/sectionFour/FourPointSix/berries.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointSix/bunny.png'), Image.asset('assets/dropbox/sectionFour/FourPointSix/bunnies.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointSix/fairy.png'), Image.asset('assets/dropbox/sectionFour/FourPointSix/fairy.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointSix/fly.png'), Image.asset('assets/dropbox/sectionFour/FourPointSix/flies.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointSix/pony.png'), Image.asset('assets/dropbox/sectionFour/FourPointSix/ponies.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointSix/spy.png'), Image.asset('assets/dropbox/sectionFour/FourPointSix/spies.png')]
  ];
  var words = [['baby', 'babies'],
    ['berry', 'berries'],
    ['bunny', 'bunnies'],
    ['fairy', 'fairies'],
    ['fly', 'flies'],
    ['pony', 'ponies'],
    ['spy', 'spies']
  ];
  var music = ['baby_babies.mp3',
    'berry_berries.mp3',
    'bunny_bunnies.mp3',
    'fairy_fairies.mp3',
    'fly_flies.mp3',
    'pony_ponies.mp3',
    'spy_spies.mp3'
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
                  Text('Base words that end with y change the y to i',
                      style: textStyle(Colors.black, screenWidth / 23)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('and add ',
                      style: textStyle(Colors.black, screenWidth / 23)
                  ),
                  Text('es ',
                      style: textStyle(Colors.red, screenWidth / 23)
                  ),
                  Text('to turn the word into a plural.',
                      style: textStyle(Colors.black, screenWidth / 23)
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
                          audioCache.play(music[tracker]);
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