import 'dart:async';
//import 'dart:html';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: FourPointEightLesson()
  ));
}
class FourPointEightLesson extends StatefulWidget {
  @override
  FourPointEight createState() => FourPointEight();
}
class FourPointEight extends State<FourPointEightLesson> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  var pictures = [[Image.asset('assets/dropbox/sectionFour/FourPointEight/1_child.png'), Image.asset('assets/dropbox/sectionFour/FourPointEight/2_children.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointEight/3_foot.png'), Image.asset('4_assets/dropbox/sectionFour/FourPointEight/feet.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointEight/5_goose.png'), Image.asset('assets/dropbox/sectionFour/FourPointEight/6_geese.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointEight/7_man.png'), Image.asset('assets/dropbox/sectionFour/FourPointEight/8_men.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointEight/9_mouse.png'), Image.asset('assets/dropbox/sectionFour/FourPointEight/10_mice.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointEight/11_person.png'), Image.asset('assets/dropbox/sectionFour/FourPointEight/12_people.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointEight/13_tooth.png'), Image.asset('assets/dropbox/sectionFour/FourPointEight/14_teeth.png')],
    [Image.asset('assets/dropbox/sectionFour/FourPointEight/15_woman.png'), Image.asset('assets/dropbox/sectionFour/FourPointEight/16_women.png')]
  ];
  var words = [['child', 'children'],
    ['foot', 'feet'],
    ['goose', 'geese'],
    ['man', 'men'],
    ['mouse', 'mice'],
    ['person', 'people'],
    ['tooth', 'teeth'],
    ['woman', 'women']
  ];
  var music = [['child.mp3', 'children.mp3'],
    ['foot.mp3', 'feet.mp3'],
    ['goose.mp3', 'geese.mp3'],
    ['man.mp3', 'men.mp3'],
    ['mouse.mp3', 'mice.mp3'],
    ['person.mp3', 'people.mp3'],
    ['tooth.mp3', 'teeth.mp3'],
    ['woman.mp3', 'women.mp3']
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
  Widget sub(BuildContext context) {
    return Container(
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // can probably simplify with RichText
                  Text('Some special base words don’t make regular changes',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('to turn into a plural, so we have to remember',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('the different plural words.',
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
                          audioCache.play(music[tracker][0]);
                          audioCache.play(music[tracker][1]);
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.5,
                      child: pictures[tracker][0],
                      width: 200
                  ),
                  Container(
                      height: screenHeight * 0.5,
                      child: pictures[tracker][1],
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