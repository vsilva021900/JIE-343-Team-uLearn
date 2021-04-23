import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/nine/ScoreMenuNine.dart';
import 'package:hearatale_literacy_app/nine/quiz/QuizNinePointSix.dart';
import 'package:hearatale_literacy_app/helper.dart';


class NinePointSixLesson extends StatefulWidget {
  @override
  NinePointSix createState() => NinePointSix();
}

class NinePointSix extends State<NinePointSixLesson> {
  var pictures = [
    "assets/dropbox/SectionNine/NinePointSix/badly.png",
    "assets/dropbox/SectionNine/NinePointSix/quickly.png",
    "assets/dropbox/SectionNine/NinePointSix/softly.png",
    "assets/dropbox/SectionNine/NinePointSix/safely.png",
    "assets/dropbox/SectionNine/NinePointSix/friendly.png",
    "assets/dropbox/SectionNine/NinePointSix/quietly.png"
  ];
  var words = [
    ["bad", "ly", "badly"],
    ["quick", "ly", "quickly"],
    ["soft", "ly", "softly"],
    ["safe", "ly", "safely"],
    ["friend", "ly", "friendly"],
    ["quiet", "ly", "quietly"]
  ];
  var wordsAudio = [
    "dropbox/SectionNine/NinePointSix/bad_ly_badly.mp3",
    "dropbox/SectionNine/NinePointSix/quick_ly_quickly.mp3",
    "dropbox/SectionNine/NinePointSix/soft_ly_softly.mp3",
    "dropbox/SectionNine/NinePointSix/safe_ly_safely.mp3",
    "dropbox/SectionNine/NinePointSix/friend_ly_friendly.mp3",
    "dropbox/SectionNine/NinePointSix/quiet_ly_quietly.mp3"
  ];

  int tracker = 0;
  bool marker = true;

  String sentenceAudio = "dropbox/SectionNine/NinePointSix/#9.6_suffixLYprnouncedLEEmeans.mp3";

  @override
  Widget build(BuildContext context) {
    setWidthHeight(context);

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
              backButton(context),
              homeButton(context),
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
                                pageBuilder: (context, _, __) => QuizNinePointSix(),
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
                              pageBuilder: (context, _, __) => ScoreNine(),
                              transitionDuration: Duration(seconds: 0)
                          )
                      );
                    },
                  )
              ),
              pinkPigButton(context)
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
                  Text('The suffix ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('ly ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('means something is ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('done ',
                      style: textStyle(Colors.red, screenWidth / 24)
                  ),
                  Text('or',
                      style: textStyle(Colors.black, screenWidth / 24)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('happens in a certain way',
                      style: textStyle(Colors.red, screenWidth / 24)
                  ),
                  Text('.',
                      style: textStyle(Colors.black, screenWidth / 24)
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
}
