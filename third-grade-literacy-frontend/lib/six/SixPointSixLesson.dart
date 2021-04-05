import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/six/ScoreMenuSix.dart';
import 'package:hearatale_literacy_app/six/quiz/QuizSixPointSix.dart';


class SixPointSixLesson extends StatefulWidget {
  @override
  SixPointSix createState() => SixPointSix();
}

class SixPointSix extends State<SixPointSixLesson> {
  var pictures = [
    "assets/dropbox/SectionSix/SixPointSix/can't.png",
    "assets/dropbox/SectionSix/SixPointSix/couldn't.png",
    "assets/dropbox/SectionSix/SixPointSix/didn't.png",
    "assets/dropbox/SectionSix/SixPointSix/doesn't.png",
    "assets/dropbox/SectionSix/SixPointSix/don't.png",
    "assets/dropbox/SectionSix/SixPointSix/isn't.png",
    "assets/dropbox/SectionSix/SixPointSix/shouldn't.png",
    "assets/dropbox/SectionSix/SixPointSix/wasn't.png",
    "assets/dropbox/SectionSix/SixPointSix/weren't.png",
    "assets/dropbox/SectionSix/SixPointSix/wont't.png",
    "assets/dropbox/SectionSix/SixPointSix/wouldn't.png",
  ];
  var words = [
    ["can not", "can't", "he can't tell which to scoop for"],
    ["could not", "couldn't", "she couldn't keep from laughing no matter how hard she tried"],
    ["did not", "din't", "he should've asked but he didn't"],
    ["does not", "doesn't", "will he be more sorry if he does or if he doesn't?"],
    ["do not", "don't", "I don't think you can cross if you don't have stripes"],
    ["is not", "isn't", "it isn't easy to play soccer in a tree"],
    ["should not", "shouldn't", "she seems ready to do something she shouldn't"],
    ["was not", "wasn't", "it wasn't a very good idea to tease his sister"],
    ["were not", "weren't", "they weren't expecting to see a volcano erupt" ],
    ["will not", "won't", "cleaning up won't be as much fun"],
    ["would not", "wouldn't", "would you or wouldn't you like to have tusks?"]

  ];
  var wordsAudio = [
    "dropbox/SectionSix/SixPointSix/1b_cannot_can't_hecan'ttellwhichtoscoopfor",
    "dropbox/SectionSix/SixPointSix/2b_could_not_couldn't_shecouldn'tkeepfromlaugh",
    "dropbox/SectionSix/SixPointSix/3b_didnot_didn't_heshouldhaveasked.mp3",
    "dropbox/SectionSix/SixPointSix/4b_doesnot_doesn't_willhebemoresorryifhedoes.mp3",
    "dropbox/SectionSix/SixPointSix/5b_do_not_don't_Idon'tthinkyoucancross.mp3",
    "dropbox/SectionSix/SixPointSix/6b_isnot_isn't_isn'teasytoplaysoccer.mp3",
    "dropbox/SectionSix/SixPointSix/7b_shouldnot_shouldn't_sheseemsreadytodo.mp3",
    "dropbox/SectionSix/SixPointSix/8b_was_not_wasn't_itwasn'taverygoodidea.mp3",
    "dropbox/SectionSix/SixPointSix/9b_werenot_weren't_theyweren'texpecting.mp3",
    "dropbox/SectionSix/SixPointSix/10b_willnot_won't_cleaningupwon't.mp3",
    "dropbox/SectionSix/SixPointSix/11b_wouldnot_wouldn't_wouldyououwouldn'tyou.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String sentenceAudio = "dropbox/SectionSix/SixPointSix/#6.6_Intro_ContractionsWithNot.mp3";

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    if (marker) {
      marker = false;
      playSentenceAudio();
    }

    return MaterialApp(
        home: Material(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
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
                      stopAudio();
                      Navigator.pop(context);
                    },
                  )
              ),
              Material(
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
              ),
              Spacer(flex: 5),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_quiz_button.png'),
                      onPressed: () {
                        stopAudio();
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, _, __) => QuizSixPointSix(),
                                transitionDuration: Duration(seconds: 0)
                            )
                        );
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_replay_button.png'),
                      onPressed: () {
                        playWordsAudio();
                      }
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                    icon: Image.asset('assets/star_button.png'),
                    onPressed: () {
                      stopAudio();
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, _, __) => ScoreSix(),
                              transitionDuration: Duration(seconds: 0)
                          )
                      );
                    },
                  )
              ),
              Material(
                  color: const Color(0xffc4e8e6),
                  child: IconButton(
                      icon: Image.asset('assets/placeholder_piggy_button.png'),
                      onPressed: () {
                        stopAudio();
                      }
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
                  Text('Contractions with ',
                      style: textStyle(Colors.black, screenWidth / 34)
                  ),
                  Text('not ',
                      style: textStyle(Colors.green, screenWidth / 34)
                  ),
                  Text('add ',
                      style: textStyle(Colors.black, screenWidth / 34)
                  ),
                  Text('n\' t, ',
                      style: textStyle(Colors.red, screenWidth / 34)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('except for that troublemaker  ',
                      style: textStyle(Colors.black, screenWidth / 34)
                  ),
                  Text('will not ',
                      style: textStyle(Colors.green, screenWidth / 34)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('which becomes ',
                      style: textStyle(Colors.black, screenWidth / 34)
                  ),
                  Text('won\'t ',
                      style: textStyle(Colors.red, screenWidth / 34)
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
                          playWordsAudio();
                        },
                      ),
                    ),
                  ),
                  Container(
                      height: screenHeight * 0.6,
                      child: Image.asset(pictures[tracker]),
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
                          playWordsAudio();
                        },
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(words[tracker][0],
                      style: textStyle(Colors.black, 30)
                  ),
                  Text(words[tracker][1],
                      style: textStyle(Colors.black, 30)
                  ),
                  Text(words[tracker][2],
                      style: textStyle(Colors.black, 30)
                  )
                ],
              )
            ]
        )
    );


  }

  playSentenceAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(sentenceAudio);
  }

  playWordsAudio() async {
    stopAudio();
    audioPlayer = await audioCache.play(wordsAudio[tracker]);
  }

  stopAudio() {
    audioPlayer.stop();
  }
}

double screenHeight, screenWidth;
TextStyle textStyle(Color col, double size) {
  return TextStyle(
    color: col,
    fontFamily: 'Comic',
    fontSize: size,
  );
}