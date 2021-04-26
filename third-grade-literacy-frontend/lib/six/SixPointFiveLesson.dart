import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/six/ScoreMenuSix.dart';
import 'package:hearatale_literacy_app/six/quiz/QuizSixPointFive.dart';
import 'package:hearatale_literacy_app/helper.dart';


class SixPointFiveLesson extends StatefulWidget {
  @override
  SixPointFive createState() => SixPointFive();
}

class SixPointFive extends State<SixPointFiveLesson> {
  var pictures = [
    "assets/dropbox/SectionSix/SixPointFive/could've.png",
    "assets/dropbox/SectionSix/SixPointFive/I've.png",
    "assets/dropbox/SectionSix/SixPointFive/should've.png",
    "assets/dropbox/SectionSix/SixPointFive/they've.png",
    "assets/dropbox/SectionSix/SixPointFive/we've.png",
    "assets/dropbox/SectionSix/SixPointFive/would've.png",
    "assets/dropbox/SectionSix/SixPointFive/you've.png",
  ];
  var words = [
    ["could have", "could've", "They could've been friends if they tried"],
    ["I have", "I've", "I've never seen so many twins"],
    ["should have", "should've", "They should've talked things out first"],
    ["they have", "they've", "They've all found something they're good at"],
    ["we have", "we've", "\"I think we've had our picture drawn,\" Duck said to Rabbit"],
    ["would have", "would've", "Bigfoot would've if he could've"],
    ["you have", "you've", "If you've got to cough, please cough in your elbow"],
  ];
  var wordsAudio = [
    "dropbox/SectionSix/SixPointFive/1b_could_have_could've_theycould'vebeenfriends.mp3",
    "dropbox/SectionSix/SixPointFive/4b_Ihave_I've_I'veneverseensomanytwins.mp3",
    "dropbox/SectionSix/SixPointFive/2b_shouldhave_should've_theyshould'vetalked.mp3",
    "dropbox/SectionSix/SixPointFive/7b_theyhave_they've_they'veallfoundsomething.mp3",
    "dropbox/SectionSix/SixPointFive/6b_wehave_we've_Ithinkwe'vehadourpicture.mp3",
    "dropbox/SectionSix/SixPointFive/3b_wouldhave_would've_Bigfootwould've.mp3",
    "dropbox/SectionSix/SixPointFive/5b_youhave_you've_Ifyou'vegottocough.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  String sentenceAudio = "dropbox/SectionSix/SixPointFive/#6.5_contractionswithHaveuse'VE.mp3";

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
                                pageBuilder: (context, _, __) => QuizSixPointFive(),
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
              pinkPigButton(context)
            ]
        )
    );
  }

  Widget sub(BuildContext context) {
    double textFontSize = screenWidth / 30;
    return Container(
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Contractions with ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('have ',
                      style: textStyle(Colors.green, screenWidth / 24)
                  ),
                  Text('add ',
                      style: textStyle(Colors.black, screenWidth / 24)
                  ),
                  Text('\'ve ',
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
                      style: textStyle(Colors.black, textFontSize)
                  ),
                  Text(words[tracker][1],
                      style: textStyle(Colors.black, textFontSize)
                  ),
                ],
              ),
              Text(words[tracker][2],
                  style: textStyle(Colors.black, textFontSize)
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
