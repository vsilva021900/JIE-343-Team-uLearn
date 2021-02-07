import 'dart:async';
//import 'dart:html';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: FourPointTenLesson()
  ));
}
class FourPointTenLesson extends StatefulWidget {
  @override
  FourPointTen createState() => FourPointTen();
}
class FourPointTen extends State<FourPointTenLesson> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  var pictures = [Image.asset('assets/dropbox/sectionFour/FourPointTen/aircraft.png'), Image.asset('assets/dropbox/sectionFour/FourPointTen/bison.png'),
    Image.asset('assets/dropbox/sectionFour/FourPointTen/deer.png'), Image.asset('assets/dropbox/sectionFour/FourPointTen/elk.png'),
    Image.asset('assets/dropbox/sectionFour/FourPointTen/fish.png'), Image.asset('assets/dropbox/sectionFour/FourPointTen/jellyfish.png'),
    Image.asset('assets/dropbox/sectionFour/FourPointTen/moose.png'), Image.asset('assets/dropbox/sectionFour/FourPointTen/reindeer.png'),
    Image.asset('assets/dropbox/sectionFour/FourPointTen/rocket.png'), Image.asset('assets/dropbox/sectionFour/FourPointTen/sheep.png'),
    Image.asset('assets/dropbox/sectionFour/FourPointTen/spacecraft.png'), Image.asset('assets/dropbox/sectionFour/FourPointTen/watercraft.png'),
  ];
  var words = ['aircraft', 'bison',
    'deer', 'elf',
    'fish', 'jellyfish',
    'moose', 'reindeer',
    'rocket', 'sheep',
    'spacecraft', 'watercraft'
  ];
  var music = ['aircraft.mp3', 'bison.mp3',
  'deer.mp3', 'elf.mp3',
  'fish.mp3', 'jellyfish.mp3',
  'moose.mp3', 'reindeer.mp3',
  'rocket.mp3', 'sheep.mp3',
  'spacecraft.mp3', 'watercraft.mp3'
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
                  Text('Some special base words are exactly the same for',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('both singular and plural, so we just have to',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('remember that these words don’t change.',
                      style: textStyle(Colors.black, 30)
                  )
                ],
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
                      Text(words[tracker], style: textStyle(Colors.black, 30))
                  ),
                  Container (
                      child:
                      Text(words[tracker], style: textStyle(Colors.black, 30))
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