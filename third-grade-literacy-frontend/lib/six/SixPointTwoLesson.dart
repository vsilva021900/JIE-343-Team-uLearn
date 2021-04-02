import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hearatale_literacy_app/WordStructures.dart';
import 'package:hearatale_literacy_app/six/ScoreMenuSix.dart';
import 'package:hearatale_literacy_app/six/quiz/QuizSixPointTwo.dart';


class SixPointTwoLesson extends StatefulWidget {
  @override
  SixPointTwo createState() => SixPointTwo();
}

class SixPointTwo extends State<SixPointTwoLesson> {
  var pictures = [
    "assets/dropbox/SectionSix/SixPointTwo/he's.png",
    "assets/dropbox/SectionSix/SixPointTwo/it's.png",
    "assets/dropbox/SectionSix/SixPointTwo/she's.png",
    "assets/dropbox/SectionSix/SixPointTwo/that's.png",
    "assets/dropbox/SectionSix/SixPointTwo/there's.png",
    "assets/dropbox/SectionSix/SixPointTwo/where's.png",
    "assets/dropbox/SectionSix/SixPointTwo/who's.png",
  ];
  var words = [
    ["He is", "He's", "He's thinking up a wonderful story"],
    ["It is", "It's", "It's not an easy knot to undue"],
    ["She is", "She's", "I think she's checking her website"],
    ["That it", "That's", "That's not as easy as it looks"],
    ["There is", "There's", "There's a surprise for Jack at the end of the bean stalk"],
    ["Where is", "Where's ", "WHere's a good place to take his pet to play?"],
    ["Who is", "Who's", "Who's in front and who's in back?"],
  ];
  var wordsAudio = [
    "dropbox/SectionSix/SixPointTwo/1b_heis_he's_He'sthinkingup.mp3",
    "dropbox/SectionSix/SixPointTwo/2b_itis_it's_It'snotaneasyknot.mp3",
    "dropbox/SectionSix/SixPointTwo/3b_she_is_she's_Ithinkshe'schedking.mp3",
    "dropbox/SectionSix/SixPointTwo/4b_thatis_that's_Thats'notaseasy.mp3",
    "dropbox/SectionSix/SixPointTwo/5b_there_is_there's_there'sasurprise.mp3",
    "dropbox/SectionSix/SixPointTwo/6b_whereis_where's_Where'sagoodplacetotake.mp3",
    "dropbox/SectionSix/SixPointTwo/7b_whois_who's_Who'sinfrontandwho'sinback.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  AudioCache audioCache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  String sentenceAudio = "dropbox/SectionSix/SixPointTwo/#6.2_contractionswithISadd's.mp3";

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
                                pageBuilder: (context, _, __) => QuizSixPointTwo(),
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
                  Text('Pronoun contractions with  ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('is ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('add ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('s ',
                      style: textStyle(Colors.red, screenWidth / 24)
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