import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
      title: '3rd Grade Literacy App',
      home: OnePointOneLesson()
  ));
}
double screenHeight, screenWidth;
class OnePointOneLesson extends StatefulWidget {
  @override
  OnePointOne createState() => OnePointOne();
}
class OnePointOne extends State<OnePointOneLesson> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  final player = AudioCache();

  @override
  void initState() {
    super.initState();

    Future<int> _getDuration() async {
      File audiofile = await audioCache.load('fix_fixed_fixing.mp3');
      await advancedPlayer.setUrl(
        audiofile.path,
      );
      int duration = await Future.delayed(
          Duration(seconds: 2), () => advancedPlayer.getDuration());
      return duration;
    }
    getLocalFileDuration() {
      return FutureBuilder<int>(
          future: _getDuration(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Text(
                'sample.mp3 duration is: ${Duration(
                    milliseconds: snapshot.data)}');
          }
      );
    }
  }
    @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                sideBar(context),
                Expanded(
                    child: sub(context)
                ),
                ElevatedButton(
                    child: Text("Play Audio"),
                    onPressed: () => player.play('fix_fixed_fixing.mp3')),
                SizedBox(height: 30),
              ],
            )
        )
    );
  }
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
    child: Column (
      children: [
      // title
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // can probably simplify with RichText
            Text('Many actions words just add ',
                style: textStyle(Colors.black, 30)
            ),
            Text('ed ',
                style: textStyle(Colors.red, 30)
            ),
            Text('and ',
                style: textStyle(Colors.black, 30)
            ),
            Text('ing',
                style: textStyle(Colors.red, 30)
            ),
            Text(' to the',
                style: textStyle(Colors.black, 30)
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' base word without making any other changes.',
              style: textStyle(Colors.black, 30)
            ),
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
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Container(
                height: screenHeight * 0.6,
                child: Image.asset('assets/dropbox/sectionOne/OnePointOne/fix.png',
                  height: 200,
                  width: 200,
                )
            ),
            Container(
              height: screenHeight * 0.6,
              child: Transform.scale(
                scale: 1,
                child: IconButton(
                  icon: Image.asset('assets/placeholder_back_button_reversed.png'),
                  onPressed: () {
                    Navigator.pop(context);
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
                Text("a", style: textStyle(Colors.black, 30))
            ),
            Container (
              child:
                Text("b", style: textStyle(Colors.black, 30))
            ),
            Container (
              child:
                Text("c", style: textStyle(Colors.black, 30))
            )
          ],
        )
      ]
    )
  );
}

TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}