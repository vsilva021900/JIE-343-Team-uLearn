import 'dart:async';
//import 'dart:html';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: FivePointOneLesson()
  ));
}
class FivePointOneLesson extends StatefulWidget {
  @override
  FivePointOne createState() => FivePointOne();
}
class FivePointOne extends State<FivePointOneLesson> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  var pictures = [Image.asset("assets/dropbox/sectionFive/FivePointOne/boot's_shoestring.png"), Image.asset("assets/dropbox/sectionFive/FivePointOne/child's_book.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointOne/dog's_hot_dog.png"), Image.asset("assets/dropbox/sectionFive/FivePointOne/dress's_collar.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointOne/elf's_lantern.png"), Image.asset("assets/dropbox/sectionFive/FivePointOne/firefly's_head.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointOne/flower's_stem.png"), Image.asset("assets/dropbox/sectionFive/FivePointOne/foot's_toenails.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointOne/fox's_tail.png"), Image.asset("assets/dropbox/sectionFive/FivePointOne/goose's_feet.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointOne/man's_saw.png"), Image.asset("assets/dropbox/sectionFive/FivePointOne/mouse's_nose.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointOne/peach's_seed.png"), Image.asset("assets/dropbox/sectionFive/FivePointOne/person's_guitar.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointOne/tooth's_point.png"), Image.asset("assets/dropbox/sectionFive/FivePointOne/woman's_headband.png"),
    Image.asset("assets/dropbox/sectionFive/FivePointOne/worker's_hardhat.png")
  ];
  var words = ["the boot's shoestring", "the child's book",
    "the dog's hot dog", "the dress's collar", "the elf's lantern",
    "the firefly's head", "the flower's stem", "the foot's toenails",
    "the fox's tail", "the goose's feet", "the man's saw",
    "the mouse's nose", "the peach's seed", "the person's guitar",
    "the tooth's point", "the woman's headband", "the worker's hardhat",
  ];
  var music = ["boot's_theboot'sbootstring.mp3", "child's_thechild'sbook.mp3",
    "dog's_thedog'scollar.mp3", "dress's_thedress'scollar.mp3", "elf's_theelf'slantern.mp3",
    "firefly's_thefirefly'shead.mp3", "flower's_theflower'sstem/mp3", "foot's_thefoot'stoenails.mp3",
    "fox's_thefox'stail.mp3", "goose's_thegoose'sfeet.mp3", "man's_theman'ssaw.mp3",
    "mouse's_themouse'snose.mp3", "peach's_thepeach'sseed.mp3", "person's_theperson'sguitar.mp3",
    "tooth's_thetooth'spoint.mp3", "woman's_thewoman'sheadband.mp3", "worker's_theworker'shardhat.mp3"
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