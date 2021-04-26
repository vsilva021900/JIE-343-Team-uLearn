import 'package:flutter/material.dart';
import 'package:hearatale_literacy_app/six/ScoreMenuSix.dart';
import 'package:hearatale_literacy_app/six/quiz/QuizSixPointEight.dart';
import 'package:hearatale_literacy_app/helper.dart';


class SixPointEightLesson extends StatefulWidget {
  @override
  SixPointEight createState() => SixPointEight();
}

class SixPointEight extends State<SixPointEightLesson> {
  var pictures = [
    "assets/dropbox/SectionSix/SixPointEight/10_dog's_thedog's(dogis)onthedog'sbed.png",
    "assets/dropbox/SectionSix/SixPointEight/11_theboy'sjumping.png",
    "assets/dropbox/SectionSix/SixPointEight/12_thecat'sbrushing.png",
    "assets/dropbox/SectionSix/SixPointEight/13_thedad'sholding.png",
    "assets/dropbox/SectionSix/SixPointEight/14_thegirl'sshowingoff.png",
    "assets/dropbox/SectionSix/SixPointEight/15_theorangutan'shanging.png",
    "assets/dropbox/SectionSix/SixPointEight/16_theseal'sbalancing.png",
    "assets/dropbox/SectionSix/SixPointEight/17_thevet'sbusy.png",
  ];
  var words = [
    "The dog’s (dog is) on the dog’s bed (on the bed belonging to the dog).",
    "The boy’s jumping on the boy’s pogo stick.",
    "The cat’s brushing the cat’s face.",
    "The dad’s holding the dad’s little girl.",
    "The girl’s showing off the girl’s new purse.",
    "The orangutan’s hanging down by the orangutan’s arm.",
    "The seal’s balancing a ball on the seal’s nose.",
    "The vet’s busy with the vet’s patients."
  ];
  var wordsAudio = [
    "dropbox/SectionSix/SixPointEight/10_dog's_thedog's(dogis)onthedog'sbed.mp3",
    "dropbox/SectionSix/SixPointEight/11_theboy'sjumping.mp3",
    "dropbox/SectionSix/SixPointEight/12_Thecat'sbrushingthecat'sface.mp3",
    "dropbox/SectionSix/SixPointEight/13_thedad'sholdingupthedad'slittlegirl.mp3",
    "dropbox/SectionSix/SixPointEight/14_Thegirl'sshowingoffthegirl'snewpurse.mp3",
    "dropbox/SectionSix/SixPointEight/15_Theorangutan'shangingdownby.mp3",
    "dropbox/SectionSix/SixPointEight/16_theseal'sbalancingaball.mp3",
    "dropbox/SectionSix/SixPointEight/17_Thevet'sbusywiththevet'spatients.mp3",
  ];

  int tracker = 0;
  bool marker = true;

  String sentenceAudio = "dropbox/SectionSix/SixPointEight/#6.8_IntroNounContractions.mp3";

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
                                pageBuilder: (context, _, __) => QuizSixPointEight(),
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
    return Container(
        color: const Color(0xFFFFFF),
        child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Be Careful! Noun ',
                      style: textStyle(Colors.black, screenWidth / 26)
                  ),
                  Text('contractions with is ',
                      style: textStyle(Colors.green, screenWidth / 26)
                  ),
                  Text('add ',
                      style: textStyle(Colors.black, screenWidth / 26)
                  ),
                  Text('‘s',
                      style: textStyle(Colors.red, screenWidth / 26)
                  ),
                  Text(',',
                      style: textStyle(Colors.black, screenWidth / 26)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('but remember that nouns also use ',
                      style: textStyle(Colors.black, screenWidth / 26)
                  ),
                  Text('‘s ',
                      style: textStyle(Colors.red, screenWidth / 26)
                  ),
                  Text('for a',
                      style: textStyle(Colors.black, screenWidth / 26)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('completely different reason, to show ',
                      style: textStyle(Colors.black, screenWidth / 26)
                  ),
                  Text('possession',
                      style: textStyle(Colors.red, screenWidth / 26)
                  ),
                  Text('.',
                      style: textStyle(Colors.black, screenWidth / 26)
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
                  Text(words[tracker],
                      style: textStyle(Colors.black, screenWidth / 35)
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
