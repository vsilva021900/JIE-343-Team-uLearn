import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: ThreePointFourLesson()
  ));
}
class ThreePointFourLesson extends StatefulWidget {
  @override
  ThreePointFour createState() => ThreePointFour();
}
class ThreePointFour extends State<ThreePointFourLesson> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  var pictures = [Image.asset('assets/dropbox/sectionThree/ThreePointFour/1_4_big-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointFour/2_4_fat-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointFour/3_4_flat-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointFour/4_4_hot-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointFour/5_4_red-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointFour/6_4_sad-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointFour/7_4_thin-er-est.png'),
    Image.asset('assets/dropbox/sectionThree/ThreePointFour/8_4_wet-er-est.png')];
  var words = [['big', 'bigger', 'biggest'], ['fat', 'fatter', 'fattest'],
    ['flat', 'flatter', 'flattest'], ['hot', 'hotter', 'hottest'],
    ['red', 'redder', 'reddest'], ['sad', 'sadder', 'saddest'],
    ['thin', 'thinner', 'thinnest'], ['wet', 'wetter', 'wettest']];
  var music = ["big.mp3",
    "fat.mp3",
    "flat.mp3",
    "hot.mp3",
    "red.mp3",
    "sad.mp3",
    "thin.mp3",
    "wet.mp3"];
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
                  Text('When comparing things, words that end with a',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('short vowel sound and then a consonant will double',
                      style: textStyle(Colors.black, 30)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('that consonant before adding ',
                      style: textStyle(Colors.black, 30)
                  ),
                  Text('er ',
                      style: textStyle(Colors.red, 30)
                  ),
                  Text('or ',
                      style: textStyle(Colors.black, 30)
                  ),
                  Text('est',
                      style: textStyle(Colors.red, 30)
                  ),
                  Text('.',
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

  double screenHeight, screenWidth;
  TextStyle textStyle(Color col, double size) {
    return TextStyle(
      color: col,
      fontFamily: 'Comic',
      fontSize: size,
    );
  }
}
