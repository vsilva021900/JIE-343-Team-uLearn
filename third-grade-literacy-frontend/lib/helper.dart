import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'WordStructures.dart';
import 'PiggyBank.dart';


// random
var random = new Random();

// used to determine size of things such as widgets and font to prevent overflow
double screenWidth;
double screenHeight;
// setter method for screenWidth and screenHeight
setWidthHeight(context) {
  screenWidth = MediaQuery.of(context).size.width;
  screenHeight = MediaQuery.of(context).size.height;
}

// used to play and stop audio
AudioCache audioCache = new AudioCache();
AudioPlayer audioPlayer = new AudioPlayer();
stopAudio() {
  audioPlayer.stop();
}

// back button for side bar (not for WordStructures, PiggyBank)
Widget backButton(context) {
  return Material(
      color: const Color(0xffc4e8e6),
      child: IconButton(
        icon: Image.asset('assets/placeholder_back_button.png'),
        onPressed: () {
          stopAudio();
          Navigator.pop(context);
        }
      )
  );
}

// home button for side bar (not for WordStructures, PiggyBank)
Widget homeButton(context) {
  return Material(
      color: const Color(0xffc4e8e6),
      child: IconButton(
        icon: Image.asset('assets/placeholder_home_button.png'),
        onPressed: () {
          stopAudio();
          Navigator.pushAndRemoveUntil(context,
              PageRouteBuilder(
                  pageBuilder: (context, _, __) => MyApp(),
                  transitionDuration: Duration(seconds: 0)
              ), (route) => false);
        },
      )
  );
}

// pink pig button for side bar
Widget pinkPigButton(context) {
    return Material(
        color: const Color(0xffc4e8e6),
        child: IconButton(
            icon: Image.asset('assets/placeholder_piggy_button.png'),
            onPressed: () {
                stopAudio();
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) => PiggyBank(),
                        transitionDuration: Duration(seconds: 0)
                    )
                );
            }
        )
    );
}

// TextStyle for Text widgets
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}
// font color: black
TextStyle textStyleB(double size) {
  return TextStyle(
    color: Colors.black,
    fontFamily: 'Comic',
    fontSize: size,
  );
}

// BoxDecoration for quiz answers
BoxDecoration answerDecoration() {
  return BoxDecoration(
    color: const Color(0xff00eeff),
    border: Border.all(color: const Color(0xff008cb3), width: 3),
    borderRadius: BorderRadius.all(Radius.circular(15)),
  );
}
// Padding for quiz answers
Padding answerPadding(String text, double size) {
  return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Text(
        text,
        style: textStyle(Colors.black, size),
        textAlign: TextAlign.center,
      )
  );
}


// image paths for stars and checkmarks for score menus
// [# gold] [ # silver]
var streakImagePaths = [
  // 0 gold
  ["", "assets/stars/one_silver.png", "assets/stars/two_silver.png", "assets/stars/three_silver.png",
    "assets/stars/four_silver.png"],
  // 1 gold
  ["assets/stars/one_gold.png", "assets/stars/one_gold_one_silver.png", "assets/stars/one_gold_two_silver.png",
    "assets/stars/one_gold_three_silver.png", "assets/stars/one_gold_four_silver.png"],
  // 2 gold
  ["assets/stars/two_gold.png", "assets/stars/two_gold_one_silver.png", "assets/stars/two_gold_two_silver.png",
    "assets/stars/two_gold_three_silver.png"],
  // 3 gold
  ["assets/stars/three_gold.png", "assets/stars/three_gold_one_silver.png", "assets/stars/three_gold_two_silver.png"],
  // 4 gold
  ["assets/stars/four_gold.png", "assets/stars/four_gold_one_silver.png"],
  // 5 gold
  ["assets/stars/five_gold.png"]
];